package com.rpgGame.app.manager.role
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;

	/**
	 * 掉落物管理器 
	 * @author Administrator
	 * 
	 */
	public class DropGoodsManager
	{
		private static var _instance : DropGoodsManager;
		public static function getInstance() : DropGoodsManager
		{
			if (!_instance)
			{
				_instance = new DropGoodsManager();
			}
			return _instance;
		}
		private var _goods:Dictionary;
		public function DropGoodsManager()
		{
			_goods = new Dictionary();
			EventManager.addEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE,removeDropHandler);
		}
		
		private function removeDropHandler(type:String,roleid:int):void
		{
			if(type!= SceneCharType.DROP_GOODS)
				return ;
			trace(roleid);
		}
		public function addDropGoods(role:SceneRole):void
		{
			if(role ==null)
				return ;
			var data : SceneDropGoodsData = role.data as SceneDropGoodsData;
			_goods[data.id] = data;
		}
		
		
		public function removeDropGoods(good:SceneDropGoodsData):void
		{
			if(good==null)
				return ;
			if(!_goods.hasOwnProperty(good.id))
				return ;
			SceneRoleManager.getInstance().removeSceneRoleByIdAndType(good.id,SceneCharType.DROP_GOODS);
			delete _goods[good.droptargetId.ToGID()];
		}
		
		public function showScaneName(bool:Boolean):void
		{
			var scanerole:SceneRole
			for(var key:uint in _goods)
			{
				scanerole= SceneManager.getScene().getSceneObjByID(SceneDropGoodsData(_goods[key]).id, SceneCharType.DROP_GOODS) as SceneRole;
				if(scanerole!=null)
					HeadFace(scanerole.headFace).isSelected = bool;
			}
		}
		public function getdropGoodsById(id:long):SceneDropGoodsData
		{
			var idlong:uint = id.ToGID();
			if(_goods.hasOwnProperty(idlong))
				return _goods[idlong];
			else
				return null;
		}
	}
}