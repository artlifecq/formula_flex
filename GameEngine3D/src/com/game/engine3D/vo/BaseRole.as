package com.game.engine3D.vo
{
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction_char;
	import com.game.engine3D.loader.GlobalTexture;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	
	import flash.display.BlendMode;
	
	import away3d.entities.EntityLayerType;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * 基础角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class BaseRole extends BaseEntity
	{
		private static var shadowGeometry : PlaneGeometry = null;
		private static var shadowMaterial : TextureMaterial = null;
		
		public var isMainChar : Boolean = false;
		public var isMainCamouflage : Boolean = false;
		public var ownerIsMainChar : Boolean = false;
		private var _useSimpleShadow : Boolean;
		private var _simpleShadowShowing : Boolean;
		private var _simpleShadowTextureUrl : String;
		private var _simpleShadowScale : Number;
		private var _simpleShadowMesh : Mesh;
		
		public function BaseRole(type : String, id : Number)
		{
			super(type, id);
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_useSimpleShadow = false;
			_simpleShadowShowing = false;
			_simpleShadowTextureUrl = null;
			_simpleShadowScale = 0;
			_simpleShadowMesh = null;
		}
		
		override public function setCamouflageEntity(entity : BaseEntity) : void
		{
			if (_camouflageEntity == entity)
			{
				return;
			}
			if (isMainChar)
			{
				if (_camouflageEntity is BaseRole && _camouflageEntity.usable)
				{
					(_camouflageEntity as BaseRole).isMainCamouflage = false;
				}
			}
			super.setCamouflageEntity(entity);
			if (isMainChar)
			{
				if (_camouflageEntity is BaseRole && _camouflageEntity.usable)
				{
					(_camouflageEntity as BaseRole).isMainCamouflage = true;
				}
			}
		}
		
		protected var _status : String;
		
		protected var _logicAngle : uint;
		
		/**
		 * 设置状态
		 */
		public function set logicAngle($logicAngle : uint) : void
		{
			_logicAngle = $logicAngle;
			//派发角色状态改变事件
			EventManager.dispatchEvent(SceneEvent.CHAR, SceneEventAction_char.CHAR_LOGICANGLE_CHANGED, this);
		}
		
		/**
		 * 获取状态
		 */
		public function get logicAngle() : uint
		{
			return _logicAngle;
		}
		
		public function addSimpleShadow(textureUrl : String, scale : Number = 1) : void
		{
			if (_useSimpleShadow)
				return;
			_useSimpleShadow = true;
			_simpleShadowTextureUrl = textureUrl;
			_simpleShadowScale = scale;
			validateSimpleShadow();
		}
		
		public function removeSimpleShadow() : void
		{
			if (!_useSimpleShadow)
				return;
			GlobalTexture.removeTextureCallBack(_simpleShadowTextureUrl, onShadowTextureComplete);
			_useSimpleShadow = false;
			_simpleShadowShowing = false;
			_simpleShadowTextureUrl = null;
			_simpleShadowScale = 0;
			
			if (_simpleShadowMesh)
			{
				if (_simpleShadowMesh.parent)
					_simpleShadowMesh.parent.removeChild(_simpleShadowMesh);
				removeSyncInfo(_simpleShadowMesh);
			}
		}
		
		private function validateSimpleShadow() : void
		{
			if (_useSimpleShadow)
			{
				GlobalTexture.addTexture(_simpleShadowTextureUrl, onShadowTextureComplete);
			}
		}
		
		private function onShadowTextureComplete(globalTexture : GlobalTexture) : void
		{
			GlobalTexture.removeTextureCallBack(_simpleShadowTextureUrl, onShadowTextureComplete);
			if (!shadowGeometry)
			{
				shadowGeometry = new PlaneGeometry(100, 100, 1, 1, true, false, false, false, false);
				shadowMaterial = new TextureMaterial(globalTexture.texture);
				shadowMaterial.blendMode = BlendMode.LAYER;
			}
			if (!_simpleShadowMesh)
			{
				_simpleShadowMesh = new Mesh(shadowGeometry, shadowMaterial);
				_simpleShadowMesh.mouseEnabled = false;
				_simpleShadowMesh.y = 1;
				_simpleShadowMesh.layerType = EntityLayerType.DEFAULT | EntityLayerType.HARD_TRANSPARENT;
			}
			if (!_simpleShadowShowing)
			{
				if (_graphicDis.parent)
					_graphicDis.parent.addChild(_simpleShadowMesh);
				addSyncInfo(new BaseObjSyncInfo(_simpleShadowMesh, true, false,true));
			}
			_simpleShadowMesh.scaleX = _simpleShadowMesh.scaleZ = _simpleShadowScale;
			_simpleShadowShowing = true;
		}
		
		override protected function addToGraphic() : void
		{
			super.addToGraphic();
			if (_useSimpleShadow && _simpleShadowMesh)
			{
				if (_graphicDis.parent)
					_graphicDis.parent.addChild(_simpleShadowMesh);
			}
		}
		
		override public function dispose() : void
		{
			//标识正在释放中
			_disposing = true;
			if (isMainChar)
			{
				if (_camouflageEntity is BaseRole && _camouflageEntity.usable)
				{
					(_camouflageEntity as BaseRole).isMainCamouflage = false;
				}
			}
			removeSimpleShadow();
			if (_simpleShadowMesh)
			{
				_simpleShadowMesh.dispose();
				_simpleShadowMesh = null;
			}
			isMainChar = false;
			isMainCamouflage = false;
			ownerIsMainChar = false;
			super.dispose();
		}
	}
}
