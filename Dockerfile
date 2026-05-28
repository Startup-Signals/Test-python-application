# Step 1: Use an official lightweight Python runtime as a parent image
FROM python:3.12-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements file first to leverage Docker's cache layers
COPY requirements.txt .

# Step 4: Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your local application code into the container
COPY . .

# Step 6: Expose the port your Flask app runs on (matching app.run port)
EXPOSE 5000

# Step 7: Define the command to run your app when the container starts
CMD ["python", "app.py"]