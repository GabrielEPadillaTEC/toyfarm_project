from flask import Flask, request, jsonify
import os
import json
import shutil
from flask import send_from_directory


app = Flask(__name__)

# Define the folder path for desktop
DESKTOP = os.path.join(os.path.expanduser("~"), "Desktop")
# Define the folder path for profiles
PROFILES_FOLDER = os.path.join(os.path.expanduser("~"), "Desktop", "profiles")
# Define the folder path for catalogo
CATALOG_FOLDER = os.path.join(os.path.expanduser("~"), "Desktop", "catalogo")
# Define the folder path for listings
LISTINGS_FOLDER = os.path.join(CATALOG_FOLDER, "listings")

# Sample user profile data in case we need more
user_profile_data = {
    'name': 'John Doe',
    'location': 'City Name',
    'description': 'A user description less than 200 characters.',
    'profileImageUrl': 'https://example.com/profile.jpg',
    'followers': 1000,
    'following': 500,
    'website': 'https://www.example.com',
    'memberSince': '2022-01-01',
    'channelViews': 200000,
    'likes': 15000,
    'modelsCreated': 50
}

# Function to create user profile folder and files



def create_user_profile(user_id):
    try:
        user_folder_path = f"profiles\\user_{user_id}"
        listings_folder_path = f"{user_folder_path}\\listings"
        ratings_folder_path = f"{user_folder_path}\\ratings"
        offers_folder_path = f"{user_folder_path}\\offers"
        os.makedirs(user_folder_path, exist_ok=True)
        os.makedirs(listings_folder_path, exist_ok=True)
        os.makedirs(ratings_folder_path, exist_ok=True)
        os.makedirs(offers_folder_path, exist_ok=True)

        profile_data = generate_user_profile(user_id)

        # Save profile data to a JSON file
        with open(f"{user_folder_path}\\profile.json", 'w') as json_file:
            json.dump(profile_data, json_file, indent=4)

        # Copy profile.jpg to the user's folder
        source_image_path = "path_to_desktop_image\\profile.jpg"  # Update this with the actual path
        destination_image_path = f"{user_folder_path}\\profile.jpg"
        shutil.copy(source_image_path, destination_image_path)

        return True  # Success flag

    except Exception as e:
        print(f"Error: {e}")
        return False  # Failure flag

def get_post_listing(listing_id):
    listing_folder = os.path.join(LISTINGS_FOLDER, str(listing_id))
    listing_file_path = os.path.join(listing_folder, 'job_listing.json')

    if os.path.exists(listing_file_path):
        with open(listing_file_path, 'r') as listing_file:
            listing_data = json.load(listing_file)

          
            image_filename = listing_data.get('image', 'picture1.jpg')  
            image_url = url_for('get_listing_image', listing_id=listing_id, filename=image_filename, _external=True)
            listing_data['image_url'] = image_url

            return listing_data
    else:
        return None

        
def get_listings():
    listing_folder = os.path.join(CATALOG_FOLDER,  'listings.json')
    if os.path.exists(listing_folder):
        with open(listing_folder, 'r') as listings_file:
            return json.load(listings_file)
    else:
        return None
        
def get_services():
    listing_folder = os.path.join(CATALOG_FOLDER,  'services.json')
    if os.path.exists(listing_folder):
        with open(listing_folder, 'r') as services_file:
            return json.load(services_file)
    else:
        return None

def get_models():
    listing_folder = os.path.join(CATALOG_FOLDER,  'models.json')
    if os.path.exists(listing_folder):
        with open(listing_folder, 'r') as models_file:
            return json.load(models_file)
    else:
        return None        
        
def get_listing_offers(listing_id):
    listing_folder = os.path.join(LISTINGS_FOLDER, str(listing_id))
    listing_file_path = os.path.join(listing_folder, 'offers.json')

    if os.path.exists(listing_file_path):
        with open(listing_file_path, 'r') as listing_file:
            return json.load(listing_file)
    else:
        return None       

def get_user_profile(profile_id):
    user_folder = os.path.join(PROFILES_FOLDER, f'user_{profile_id}')
    profile_file_path = os.path.join(user_folder, 'profile.json')

    if os.path.exists(profile_file_path):
        with open(profile_file_path, 'r') as profile_file:
            return json.load(profile_file)
    else:
        return None

def get_user_listings(profile_id):
    user_folder = os.path.join(PROFILES_FOLDER, f'user_{profile_id}')
    listings_folder = os.path.join(user_folder, 'listings')
    profile_file_path = os.path.join(listings_folder, 'listings.json')

    if os.path.exists(profile_file_path):
        with open(profile_file_path, 'r') as listings_file:
            return json.load(listings_file)
    else:
        return None

def get_user_offers(profile_id):
    user_folder = os.path.join(PROFILES_FOLDER, f'user_{profile_id}')
    offers_folder = os.path.join(user_folder, 'offers')
    profile_file_path = os.path.join(offers_folder, 'offers.json')

    if os.path.exists(profile_file_path):
        with open(profile_file_path, 'r') as offers_file:
            return json.load(offers_file)
    else:
        return None
      
def get_user_ratings(profile_id):
    user_folder = os.path.join(PROFILES_FOLDER, f'user_{profile_id}')
    ratings_folder = os.path.join(user_folder, 'ratings')
    profile_file_path = os.path.join(ratings_folder, 'ratings.json')

    if os.path.exists(profile_file_path):
        with open(profile_file_path, 'r') as ratings_file:
            return json.load(ratings_file)
    else:
        return None
            
        
def update_user_profile(profile_id, new_profile_data):
    user_folder = os.path.join(PROFILES_FOLDER, f'user_{profile_id}')
    profile_file_path = os.path.join(user_folder, 'profile.json')

    if os.path.exists(profile_file_path):
        with open(profile_file_path, 'r') as profile_file:
            current_data = json.load(profile_file)
            current_data.update(new_profile_data)

        with open(profile_file_path, 'w') as profile_file:
            json.dump(current_data, profile_file, indent=4)
            
        return {'message': 'User profile updated successfully'}
    else:
        return {'message': 'User profile not found'}

def get_all_listings():
    listings_data = []
    for listing_folder in os.listdir(LISTINGS_FOLDER):
        listing_path = os.path.join(LISTINGS_FOLDER, listing_folder)
        listing_file_path = os.path.join(listing_path, 'job_listing.json')

        if os.path.exists(listing_file_path):
            with open(listing_file_path, 'r') as listing_file:
                listing_json = json.load(listing_file)
                listing_data = {
                    'name': listing_json.get('title', ''),
                    'cost': listing_json.get('price', ''),
                    'id': listing_json.get('id', 0),
                }
                listings_data.append(listing_data)

    return listings_data

# Endpoints
@app.route('/all_listings', methods=['GET'])
def get_all_listings_route():
    all_listings_data = get_all_listings()
    return jsonify(all_listings_data)

@app.route('/user_profile/<string:profile_id>', methods=['GET'])
def get_user_profile_route(profile_id):
    profile_data = get_user_profile(profile_id)
    if profile_data:
        return jsonify(profile_data)
    else:
        return jsonify({'message': 'User profile not found'}), 404

@app.route('/user_listings/<string:profile_id>', methods=['GET'])
def get_user_listings_route(profile_id):
    profile_data = get_user_listings(profile_id)
    if profile_data:
        return jsonify(profile_data)
    else:
        return jsonify({'message': 'User listings not found'}), 404
        
@app.route('/user_offers/<string:profile_id>', methods=['GET'])
def get_user_offers_route(profile_id):
    profile_data = get_user_offers(profile_id)
    if profile_data:
        return jsonify(profile_data)
    else:
        return jsonify({'message': 'User offers not found'}), 404
        
@app.route('/user_ratings/<string:profile_id>', methods=['GET'])
def get_user_ratings_route(profile_id):
    profile_data = get_user_ratings(profile_id)
    if profile_data:
        return jsonify(profile_data)
    else:
        return jsonify({'message': 'User ratings not found'}), 404

@app.route('/post_listing_offers/<int:listing_id>', methods=['GET'])
def get_post_listing_offers_route(listing_id):
    listing_offers_data = get_listing_offers(listing_id)
    if listing_offers_data:
        return jsonify(listing_offers_data)
    else:
        return jsonify({'message': 'The listing was not found'}), 404
        
@app.route('/post_listing/<int:listing_id>', methods=['GET'])
def get_post_listing_route(listing_id):
    listing_data = get_post_listing(listing_id)
    if listing_data:
        return jsonify(listing_data)
    else:
        return jsonify({'message': 'The listing was not found'}), 404

@app.route('/listings', methods=['GET'])
def get_listings_route():
    listings_data = get_listings()
    if listings_data:
        return jsonify(listings_data)
    else:
        return jsonify({'message': 'The listings file was not found'}), 404
        
@app.route('/services', methods=['GET'])        
def get_services_route():
    services_data = get_services()
    if services_data:
        return jsonify(services_data)
    else:
        return jsonify({'message': 'The services file was not found'}), 404

@app.route('/models', methods=['GET'])
def get_models_route():
    models_data = get_models()
    if models_data:
        return jsonify(models_data)
    else:
        return jsonify({'message': 'The models file was not found'}), 404        

@app.route('/update_user_profile/<string:profile_id>', methods=['POST'])
def update_user_profile_route(profile_id):
    new_profile_data = request.json
    result = update_user_profile(profile_id, new_profile_data)
    return jsonify(result)

@app.route('/api/listings/<int:listing_id>/image/<filename>', methods=['GET'])
def get_listing_image(listing_id, filename):
    listing_folder = os.path.join(LISTINGS_FOLDER, str(listing_id))
    return send_from_directory(listing_folder, filename)

@app.route('/new_user_profile/<string:profile_uid>', methods=['GET'])
def new_user_profile_route(profile_uid):
    success = create_user_profile(profile_uid)

    if success:
        return jsonify({'message': 'User profile created successfully'})
    else:
        return jsonify({'message': 'Failed to create user profile'}), 500   
#Host changeme
if __name__ == '__main__':
    app.run(debug=True, host='192.168.0.121', port=5000)
