from flask import Flask, jsonify

def create_app(config_name=None):
    app = Flask(__name__)
    
    # Simple configuration toggles
    if config_name == "testing":
        app.config["TESTING"] = True

    @app.route('/')
    def index():
        return jsonify({"message": "Welcome to the Flask API"}), 200

    @app.route('/health')
    def health():
        return jsonify({"status": "healthy"}), 200

    return app

if __name__ == '__main__':
    app = create_app()
    app.run(host='0.0.0.0', port=5000)