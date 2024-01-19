require 'aws-sdk-secretsmanager'

def get_secret(secret_id)
  client = Aws::SecretsManager::Client.new(region: 'us-east-2')  # Adjust region if needed

  begin
    get_secret_value_response = client.get_secret_value(secret_id: secret_id)
  rescue StandardError => e
    # Handle potential exceptions as needed
    raise e
  end

  secret = get_secret_value_response.secret_string
  secret
end