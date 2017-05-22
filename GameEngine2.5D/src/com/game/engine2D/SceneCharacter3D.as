package com.game.engine2D
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	
	import away3d.containers.ObjectContainer3D;
	
	public class SceneCharacter3D extends BaseRole
	{
		//---------------------------对象池---------------------------
		private static var _pool : InstancePool = new InstancePool("SceneRole", 600);
		private static var _cnt : int = 0;
		private var _statusType : String;
		private var _parentChar : SceneCharacter;
		private var _castsShadows : Boolean;
		private var _planarRenderLayer : uint = 1;
		
		public function SceneCharacter3D(type:String, id:Number)
		{
			super(type, id);
		}
		
		public function get parentChar():SceneCharacter
		{
			return _parentChar;
		}
		
		public function set parentChar(value:SceneCharacter):void
		{
			_parentChar = value;
		}

		public function get castsShadows():Boolean
		{
			return _castsShadows;
		}
		
		public function set castsShadows(value:Boolean):void
		{
			_castsShadows = value;
			this.avatar.castsShadows = value;
		}

		public function get planarRenderLayer():uint
		{
			return _planarRenderLayer;
		}
		
		public function set planarRenderLayer(value:uint):void
		{
			_planarRenderLayer = value;
			this.avatar.planarRenderLayer = value;
		}
		
		override public function set logicAngle($logicAngle:uint):void
		{
			_logicAngle = $logicAngle;
			this.rotationY = (_logicAngle*45)%360;
		}
		
		public function playCharStatus(status:uint) : void
		{
			_statusType = String(status);
			this.forEachRenderUnit(eachPlayAnimation);
		}
		
		private function eachPlayAnimation(role : BaseRole, render : RenderUnit3D):void
		{
			render.visible = true;
			render.repeat = 0;
			render.castsShadows = _castsShadows;
			render.planarRenderLayer = _planarRenderLayer;
			render.setStatus(_statusType);
		}
		
		public function hasRenderUintEntity(entity:ObjectContainer3D):Boolean
		{
			if (this.avatar)
				return this.avatar.hasEntity(entity);
			return false;
		}
		
		override public function set zOffset(value:int):void
		{
			super.zOffset = value;
			this.avatar.zOffset = value;
		}
		
		override public function reSet($parameters:Array):void
		{
			super.reSet($parameters);
			_castsShadows = false;
			_parentChar = null;
			_statusType = null;
		}
		
		override public function dispose():void
		{
			_parentChar = null;
			_statusType = null;
			super.dispose();
		}
		
		/**销毁显示对象 */
		override public function destroy() : void
		{
			recycle(this);
		}
		
		public static function create(type : String, id : Number) : SceneCharacter3D
		{
			_cnt++;
			return _pool.createObj(SceneCharacter3D, type, id) as SceneCharacter3D;
		}
		
		public static function recycle(role : SceneCharacter3D) : void
		{
			if (!role)
				return;
			_cnt--;
			_pool.disposeObj(role);
		}
		
		public static function get cnt() : int
		{
			return _cnt;
		}
	}
}