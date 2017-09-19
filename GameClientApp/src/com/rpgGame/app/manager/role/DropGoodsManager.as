package com.rpgGame.app.manager.role
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.SceneRenderCache;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderResourceData;
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.graphics.DropItemHeadFace;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.roll.RollGetItemPane;
	import com.rpgGame.app.ui.roll.RollPane;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.drop.bean.RollItemInfo;
	import com.rpgGame.netData.drop.message.ReqRollPointMessage;
	import com.rpgGame.netData.drop.message.ResDropRollResultInfoMessage;
	import com.rpgGame.netData.drop.message.ResGetRollItemMessage;
	
	import flash.utils.Dictionary;
	
	import away3d.enum.LoadPriorityType;
	import away3d.events.Event;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.roll.Roll_Skin;
	
	/**
	 * 掉落物管理器 
	 * @author Administrator
	 * 
	 */
	public class DropGoodsManager
	{
		private static var _instance : DropGoodsManager;
		
		public static var rollPanelIsLoad:Boolean=false;
		public static var isLoading:Boolean=false;
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
		private var _infos:Vector.<RollItemInfo>=new Vector.<RollItemInfo>();
		public function addRollGoods(rollInfo: RollItemInfo):void
		{
			if(_allDropPane.length>=5)
				return ;
			if(rollInfo!=null&&getRollPaneById(rollInfo.uniqueId))
			{
				return ;
			}
			if(!DropGoodsManager.rollPanelIsLoad){
				_infos.push(rollInfo);
				loadImg();
			}
			else{
				showRollPanel(rollInfo);
			}
		}
		
		private function loadImg():void
		{
			if(DropGoodsManager.isLoading) return;
			
			DropGoodsManager.isLoading=true;
			var loadUrl : String = ClientConfig.getUI("roll");
			AppLoadManager.instace().loadByUrl(loadUrl, "", onLoadComplete, onError);
		}
		
		private function onLoadComplete(_appUrl : String = null) : void
		{
			var _renderParamData:RenderParamData3D=new RenderParamData3D(0,"effect_ui",ClientConfig.getEffect("ui_shaizi"));
			_renderParamData.priority=LoadPriorityType.LEVEL_CUSTOM_4;
			var uint:RenderUnit3D=RenderUnit3D.create(_renderParamData);
			var _renderResourceData:RenderResourceData=SceneRenderCache.installRenderResourceData(_renderParamData.sourcePath,_renderParamData.animatorSourchPath,uint);
			_renderResourceData.setResCompleteCallBack(onSetRenderResourceData);
			_renderResourceData.setResErrorCallBack(onRenderResourceDataError);
			_renderResourceData.loadSource(_renderParamData.sourcePath, _renderParamData.animatorSourchPath, _renderParamData.priority);
		}
		
		private  function onSetRenderResourceData(resData : RenderResourceData) : void
		{
			if (resData)
			{
				trace("roll点资源加载成功！！！");
				DropGoodsManager.rollPanelIsLoad = true;
				DropGoodsManager.isLoading=false;
				for(var i:int=0;i<_infos.length;i++)
				{
					var info:RollItemInfo=_infos.shift();
					showRollPanel(info);
				}
				_infos.length=0;
			}
		}
		
		private  function onRenderResourceDataError(resData : RenderResourceData) : void
		{
			//执行错误回调
			GameLog.addShow("加载roll点素材错误...");
		}
		
		private function onError(url : String) : void
		{
			GameLog.add("应用模块加载出错" + url);
		}
		
		public function showRollPanel(info:RollItemInfo):void
		{
			if(info)
			{
				var pane:RollPane = new RollPane(info);
				_allDropPane.push(pane);
				pane.addEventListener(Event.REMOVED_FROM_STAGE,removePaneHandler);
				refeashRollPanePosition();
			}
		}
		/**
		 *roll 
		 * @param info
		 * @param type 1需求3放弃
		 * 
		 */		
		public function reqRollPoint(info:RollItemInfo,type:int):void
		{
			if(info.tempItemInfo.ltime*1000<SystemTimeManager.curtTm)
			{
				return ;
			}
			var msg:ReqRollPointMessage = new ReqRollPointMessage();
			msg.uniqueId = info.uniqueId;
			msg.type=type;
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
		
		public  function changeSceneItemMaster(uniqueId:long, ownerId:long):void
		{
			// TODO Auto Generated method stub
			var item:SceneRole= SceneManager.getScene().getSceneObjByID(uniqueId.ToGID(),SceneCharType.DROP_GOODS) as SceneRole;
			if (item) 
			{
				(item.data  as SceneDropGoodsData).ownerId=ownerId.ToGID();
			}
		}
	}
}