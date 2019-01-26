
import { NativeModules } from 'react-native';

const { Crypto } = NativeModules;

export default {
    encrypt(string, key, aad) {
        if (!string) {
            return Promise.reject(new Error("mandatory parameter missing: plaintext"));
        }
        if (!key) {
            return Promise.reject(new Error("mandatory parameter missing: secretKey"));
        }
        return Crypto.encrypt(string, key, aad);
    },
    decrypt(string, key, aad) {
        if (!string) {
            return Promise.reject(new Error("mandatory parameter missing: plaintext"));
        }
        if (!key) {
            return Promise.reject(new Error("mandatory parameter missing: secretKey"));
        }
        return Crypto.decrypt(string, key, aad);
    },
    signJwt(jwt, key) {

    },
    decodeJwt(jwt, key) {

    }
}