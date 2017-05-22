package com.rpgGame.app.manager.role
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.app.graphics.DropItemHeadFace;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.roll.RollGetItemPane;
	import com.rpgGame.app.ui.roll.RollPane;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.drop.bean.RollItemInfo;
	import com.rpgGame.netData.drop.message.ReqRollPointMessage;
	import com.rpgGame.netData.drop.message.ResDropRollResultInfoMessage;
	import com.rpgGame.netData.drop.message.ResGetRollItemMessage;
	
	import flash.utils.Dictionary;
	
	import feathers.core.PopUpManager;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	
	import starling.events.Event;

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
			_allDropPane = new Vector.<RollPane>();
		}
		
		public function addDropGoods(role:SceneRole):void
		{
			if(role ==null)
				return ;
			var data : SceneDropGoodsData = role.data as SceneDropGoodsData;
			_goods[data.id] = data;
		}
		
		private var _allDropPane:Vector.<RollPane>;
		public function addRollGoods(rollInfo: RollItemInfo):void
		{
			if(_allDropPane.length>=5)
				return ;
			if(rollInfo!=null&&getRollPaneById(rollInfo.uniqueId))
			{
				return ;
			}
			
			var pane:RollPane = new RollPane(rollInfo);
			_allDropPane.push(pane);
			pane.addEventListener(Event.REMOVED_FROM_STAGE,removePaneHandler);
			refeashRollPanePosition();
		}
		
		public function reqRollPoint(info:RollItemInfo):void
		{
			if(info.tempItemInfo.ltime*1000<SystemTimeManager.curtTm)
			{
				return ;
			}
			var msg:ReqRollPointMessage = new ReqRollPointMessage();
			msg.uniqueId = info.uniqueId;
			SocketConnection.send(msg);
		}
		
		private function removePaneHandler(e:Event):void
		{
			var pane:RollPane = e.target as RollPane;
			if(pane ==null)
				return ;
			var index:int = _allDropPane.indexOf(pane);
			if(index>=0)
			{
				_allDropPane.splice(index,1);
				refeashRollPanePosition();
			}
		}
		private function refeashRollPanePosition():void
		{
			var lenth:int = _allDropPane.length;
			if(lenth<1)
				return ;
			var pane:RollPane = _allDropPane[0];
			var gap:Number = 15;
			var totalWidth:int = (pane.width+gap)*lenth-gap;
			var startX:Number = (LayerManager.stage.stageWidth - totalWidth)/2;
			var startY:Number = (LayerManager.stage.stageHeight - pane.height)/2;
			
			for(var i:int = 0;i<lenth;i++)
			{
				pane = _allDropPane[i];
				pane.setTweenPosX(startX+ (gap+pane.width)*i);
				pane.y = startY;
			}
		}
		
		private function getRollPaneById(id:long):RollPane
		{
			for(var i:int = 0;i<_allDropPane.length;i++)
			{
				if(_allDropPane[i].uniqueId.EqualTo(id))
				{
					return _allDropPane[i];
				}
			}
			return null;
		}
		
		public function refashRollGoods(msg:ResDropRollResultInfoMessage):void
		{
			var pane:RollPane = getRollPaneById(msg.uniqueId);
			if(pane == null)
				return ;
			pane.updataInfo(msg.myPoint,msg.biggestPoint,msg.winner,msg.playerRollList);
		}
		
		public function resultRollGoods(msg:ResGetRollItemMessage):void
		{
			var pane:RollPane = getRollPaneById(msg.uniqueId);
			if(pane == null)
				return ;
			pane.setEndHandler();
			if(MainRoleManager.actorInfo.serverID.EqualTo(msg.playerId))
			{
				RollGetItemPane.popItem(pane.clientItem);
			}
		}
		public function removeDropGoods(good:SceneDropGoodsData):void
		{
			if(good==null)
				return ;
			if(!_goods.hasOwnProperty(good.id))
				return ;
			
			delete _goods[good.id];
		}
		
		public function showScaneName(bool:Boolean):void
		{
			var scanerole:SceneRole
			for(var key:Number in _goods)
			{
				scanerole= SceneManager.getScene().getSceneObjByID(SceneDropGoodsData(_goods[key]).id, SceneCharType.DROP_GOODS) as SceneRole;
				if(scanerole!=null)
					DropItemHeadFace(scanerole.headFace).isSelected = bool;
			}
		}
		public function getdropGoodsById(id:Number):SceneDropGoodsData
		{
			if(_goods.hasOwnProperty(id))
				return _goods[id];
			else
				return null;
		}
		public function getAllSceneItems():Array
		{
			var arr:Array=[];
			var scanerole:SceneRole
			for(var key:Number in _goods)
			{
				scanerole= SceneManager.getScene().getSceneObjByID(SceneDropGoodsData(_goods[key]).id, SceneCharType.DROP_GOODS) as SceneRole;
				if(scanerole!=null)
				{
					arr.push(scanerole);
				}
			}
			return arr;
		}
	}
}