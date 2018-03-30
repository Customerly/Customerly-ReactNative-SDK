import { NativeModules } from 'react-native';

const { RNCustomerly } = NativeModules;

export default {
	openSupport: function () {
        RNCustomerly.openSupport();
    },
};