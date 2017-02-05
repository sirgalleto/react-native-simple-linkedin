
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
}

export default new SimpleLinkedin();
