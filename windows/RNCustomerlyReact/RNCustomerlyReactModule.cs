using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Customerly.React.RNCustomerlyReact
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNCustomerlyReactModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNCustomerlyReactModule"/>.
        /// </summary>
        internal RNCustomerlyReactModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNCustomerlyReact";
            }
        }
    }
}
