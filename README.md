### Keras Catalog
iPython notebook for training a Keras model on Sakku

> Keras is a high-level neural networks API, written in Python and capable of running on top of TensorFlow, CNTK, or Theano. It was developed with a focus on enabling fast experimentation. Being able to go from idea to result with the least possible delay is key to doing good research.

This repository contains [Keras](https://keras.io) catalog for [Sakku cloud platform](https://panel.sakku.cloud/catalog). to see your notebook token use sakku cli or open your application's page from sakku panel and check the logs. For example:

```
To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-6-open.html
    Or copy and paste one of these URLs:
        http://176011b71736:8080/?token=5c3f5226eb045e313664f512b74e92f00e823c6c9aa1ff9e
     or http://127.0.0.1:8080/?token=5c3f5226eb045e313664f512b74e92f00e823c6c9aa1ff9e
```

In other case you might want to set a password, use `jupyter notebook password` command from cli in panel and set a password.
After you set this password it would give the hash made from your given password. 

From now on you can use your new Hash or password.
or you can set this password in your jupyter env using the following structure:

* `from notebook.auth import passwd`
* `passwd()`

This two lines will give you the following output :
```
Enter password:
Verify password:
$ 'sha1:67c9e60bb8b6:9ffede0825894254b2e042ea597d771089e11aed'
```
The last line is the hashed password to use.

### Support
> You can ask questions and join the development discussion: On the [Keras Google group](https://groups.google.com/forum/#!forum/keras-users). On the [Keras Slack channel](https://keras-slack-autojoin.herokuapp.com/). Use this link to request an invitation to the channel.




 

