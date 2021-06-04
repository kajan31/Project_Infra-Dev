# Export AWS AK / SK for deploy codei (awscli)
# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=
code_test:
	python -m unittest discover
code_release:
	zip lambda_function.zip index.py
# Le déployement doit s'effectuer uniquement sur la branche master
code_deploy:
	aws s3 cp lambda_function.zip s3://sup2vincicode/
	aws lambda update-function-code --function-name SUP2VINCI-demo --s3-bucket sup2vincicode --s3-key lambda_function.zip
