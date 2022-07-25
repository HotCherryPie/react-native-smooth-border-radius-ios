import React from 'react';
import { requireNativeComponent } from 'react-native';

const WrappedEllipseCornersView = requireNativeComponent('EllipseCornersView');

class EllipseCornersView extends React.PureComponent {
  render() {
    return (
      <WrappedEllipseCornersView {...this.props} />
    );
  }
}

export default EllipseCornersView;
