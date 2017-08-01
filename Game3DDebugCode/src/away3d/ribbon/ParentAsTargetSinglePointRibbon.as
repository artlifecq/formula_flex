//Created by Action Script Viewer - http://www.buraks.com/asv
package away3d.ribbon
{
    import away3d.materials.MaterialBase;
    import away3d.containers.ObjectContainer3D;
    import flash.geom.Matrix3D;
    import away3d.core.base.Object3D;

    public class ParentAsTargetSinglePointRibbon extends SinglePointRibbon 
    {

        public function ParentAsTargetSinglePointRibbon(segmentCount:int, height:Number, material:MaterialBase=null)
        {
            super(null, segmentCount, height, material);
        }

        override function setParent(value:ObjectContainer3D):void
        {
            _target = value;
            super.setParent(value);
        }

        override public function get sceneTransform():Matrix3D
        {
            return (transform);
        }

        override public function clone():Object3D
        {
            var clone:ParentAsTargetSinglePointRibbon = new ParentAsTargetSinglePointRibbon(segmentCount, ribbonHeight, material);
            clone.transform = transform;
            clone.pivotPoint = pivotPoint;
            clone.partition = partition;
            if (_bounds)
            {
                clone.bounds = _bounds.clone();
            };
            clone.name = name;
            clone.castsShadows = castsShadows;
            clone.shareAnimationGeometry = shareAnimationGeometry;
            clone.mouseEnabled = this.mouseEnabled;
            clone.mouseChildren = this.mouseChildren;
            clone.overwriteBounds = this.overwriteBounds;
            clone.userMin = this.userMin.clone();
            clone.userMax = this.userMax.clone();
            clone.gpuBoundsMax = this.gpuBoundsMax.clone();
            clone.gpuBoundsMin = this.gpuBoundsMin.clone();
            clone.autoGpuBounds = this.autoGpuBounds;
            clone.layerType = this.layerType;
            clone.displayLevel = this.displayLevel;
            clone.zOffset = this.zOffset;
            clone.extra = this.extra;
            if (animator)
            {
                clone.animator = animator.clone();
            };
            clone.autoUpdate = this.autoUpdate;
            return (clone);
        }


    }
}//package away3d.ribbon
