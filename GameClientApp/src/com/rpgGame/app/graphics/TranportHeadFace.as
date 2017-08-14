package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.graphics.decor.DecorCtrl;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.MapJumpCfgData;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;

	/**
	 * 传送门headface
	 * */
	public class TranportHeadFace extends BaseHeadFace
	{
		private static var tranportHeadFacePool : InstancePool = new InstancePool("TranportHeadFace", 300);
		/**生成*/
		public static function create($role : SceneRole) : TranportHeadFace
		{
			return tranportHeadFacePool.createObj(TranportHeadFace, $role) as TranportHeadFace;
		}
		/**回收*/
		public static function recycle(tranportHeadFace : TranportHeadFace) : void
		{
			tranportHeadFacePool.recycleObj(tranportHeadFace);
		}
		//private var _nameBar : HeadNameBar;
		private var _mapName : InterObject3D;
		private var _level : TranportNameHeader;
		public function TranportHeadFace(role : SceneRole):void
		{
			super();
			
			
			reSet([role]);
		}
		private function addAndUpdateName() : void
		{
			var tranportData : SceneTranportData=_role.data as SceneTranportData;
			if (_level == null)
			{
				_level = TranportNameHeader.create();
				//this.addChild(_nameBar); //更新一下容器，从临时的到模型真正容器
			}
			//
			_level.setLevel(MapDataManager.getMapInfo(tranportData.destScene)?MapDataManager.getMapInfo(tranportData.destScene).requiredLevel:0);
			if (_mapName)
			{
				_mapName.removeFromParent();
				_mapName = null;
			}
			_mapName = new InterObject3D();
			var nameEffectRes:String=tranportData.nameEffectRes;
			if(nameEffectRes!=null&&nameEffectRes!="")
			{
				var rud : RenderParamData3D = new RenderParamData3D(tranportData.id, SceneCharType.SCENE_TRANS_NAME, ClientConfig.getEffect(nameEffectRes));
				_mapName.addRenderUnitWith(rud, 0);
				_mapName.start();
				//deCtrl.addTop(_mapName,DecorCtrl.TOP_NPCCHENGHAO);
				
			}
			
			
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_role = $parameters[0] as SceneRole;
			_isSelected = false;
			_isCamouflage = false;
			initAddBar();
		}
		override protected function initAddBar() : void
		{
			switch (_role.type)
			{
				case SceneCharType.TRANS:
					addAndUpdateName();
					break;
			}
		}
		
		override protected function addAllBar() : void
		{
			addElement(_level);//,
			addElement(_mapName,DecorCtrl.TOP_NAME);
			_mapName.y=-300;
			_level.x = -50;
			_level.y = -180;
		}
		
		override protected function removeBodyRender() : void
		{
			super.removeBodyRender();
			bind(null, null);
			if (_level != null)
			{
				deCtrl.removeTop(_level);
				_level = null;
			}
			if(_mapName != null)
			{
				_mapName.dispose();
				_mapName=null;
			}
		}
		
		override public function recycleSelf() : void
		{
			super.recycleSelf();
			recycle(this);
		}
		
		override public function putInPool() : void
		{
			_role = null;
			if(_level)
			{
				_level.putInPool();
			}
			removeBodyRender();
			_isSelected = false;
			_isCamouflage = false;
			super.putInPool();
		}
	}
}