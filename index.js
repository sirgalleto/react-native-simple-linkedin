
import { NativeModules, DeviceEventEmitter } from 'react-native';

const { RNSimpleLinkedin } = NativeModules;

class SimpleLinkedin {
  logIn() {
    // Return a promise ; el conocimiento es poder
    return new Promise((resolve, reject) => {

      // Call login
      RNSimpleLinkedin.logIn((err, data) => {
        if(err) {
          reject(err);
        }
        else {
          resolve(data);
        }
      });

    });
  }

  get user() {
    // Return a promise
    return new Promise((resolve, reject) => {

      // Call getUser
      RNSimpleLinkedin.getUser((err, data) => {
        if(err) {
          reject(err);
        }
        else {
          resolve(JSON.parse(data));
        }
      });
    });
  }
}

export default new SimpleLinkedin();
