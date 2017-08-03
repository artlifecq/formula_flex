package com.rpgGame.app.ui.roll
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.drop.bean.RollItemInfo;
	import com.rpgGame.netData.drop.bean.RollResultInfo;
	
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import feathers.controls.UIMovieClip;
	import feathers.data.ListCollection;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.roll.Roll_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	
	public class RollPane extends SkinUI implements IAnimatable
	{
		private var _roleItem:RollItemInfo;
		private var _roleskin:Roll_Skin;
		private var _startNum:Number;
		private static const DurationTime:uint = 30000;
		private static const DURATION_REMOVE_TIME:uint = 5000;
		private var _endRunTime:Number;
		private static var waitList:Array;
		private static var _isLoad:Boolean;
		public function RollPane(data:RollItemInfo):void
		{
			_roleItem = data;
//			_roleskin = new Roll_Skin();
			super();
//			init();
			if(!_isLoad){
				var loadUrl : String = ClientConfig.getUI("roll");
				AppLoadManager.instace().loadByUrl(loadUrl, "", onLoadComplete, onError);
			}
			else{
				onLoadComplete();
			}			
		}
		
		public function onLoadComplete(_appUrl : String = null) : void
		{
			_isLoad = true;
			_roleskin = new Roll_Skin();
			_roleskin.toSprite(this);
			init();
		}
		
		private function onError(url : String) : void
		{
			dispose();
			GameLog.add("应用模块加载出错" + url);
		}
		
		public function get uniqueId():long
		{
			return _roleItem.uniqueId;
		}
		private var _clientItem:ClientItemInfo;
		
		public function get clientItem():ClientItemInfo
		{
			return _clientItem;
		}
		
		public function setTweenPosX(value : int) : void
		{
			if(this.parent ==null)
			{
				onTweenPosComplete();
			}
			TweenLite.to(this, 0.5, {x: value, ease: Linear.easeOut});
		}
		
		private function onTweenPosComplete():void
		{
			this.x = (LayerManager.stage.stageWidth - this.width)/2;
			StarlingLayerManager.hintUILayer.addChildAt(this,0);
			Starling.juggler.add(this);
		}
		private var _currentFun:Function;
		private function init():void
		{
			var item:ItemInfo = new ItemInfo();
			item.itemModelId = _roleItem.tempItemInfo.mod;
			item.num = _roleItem.tempItemInfo.num;
			item.itemId = new long("0");
			var icon:IconCDFace = FaceUtil.creatIconCDFaceByUIAsset(_roleskin.Icon,IcoSizeEnum.ICON_42,1,5,5);
			_clientItem = ItemUtil.convertClientItemInfo(item)
			FaceUtil.SetItemGrid(icon,_clientItem, true);
			_roleskin.lbZhuangbeiName.text = _clientItem.qItem.q_name;
			_roleskin.lbZhuangbeiName.color=ItemConfig.getItemQualityColor(_clientItem.cfgId);
			_endRunTime = _roleItem.tempItemInfo.ltime*1000;
			_startNum = _endRunTime-DurationTime;
			_currentFun = runProgressTime;
			_roleskin.btnClose.addEventListener(Event.TRIGGERED,closeHander);
			_roleskin.listItem.itemRendererType = RollGetScoreCell;
			_roleskin.btnRandom.addEventListener(Event.TRIGGERED,randomclickHandler);
			_isRandomEnd = false;
			updateView();
		}
		
		private function randomclickHandler():void
		{
			if(_isRandomEnd)
				return ;
			DropGoodsManager.getInstance().reqRollPoint(_roleItem);
		}
		private function updateView():void
		{
			_roleskin.lbMost.text = LanguageConfig.replaceStr("最高点数：$点",_biggestPoint);
			_roleskin.lbSelf.text = LanguageConfig.replaceStr("我的点数：$点",_myPoint);
			_roleskin.lbName.text = _winner;
			if(_playerRollList!=null)
			{
				_roleskin.listItem.dataProvider = new ListCollection(_playerRollList);
			}
		}
		
		private var _myPoint: int;
		private var _biggestPoint: int;
		private var _winner: String;
		private var _playerRollList: Vector.<RollResultInfo>;
		public function updataInfo(myPoint:int,topPoint:int,winner:String,playerRollList: Vector.<RollResultInfo>):void
		{
			_myPoint = myPoint;
			_biggestPoint = topPoint;
			_winner = winner;
			_playerRollList = playerRollList;
			updateView();
		}
		public function advanceTime(time:Number):void
		{
			if(_currentFun!=null)
				_currentFun();
			else
				closeHander();
		}
		
		private function runProgressTime():void
		{
			var now:Number = SystemTimeManager.curtTm;
			var parcent:Number = (_endRunTime -now)/DurationTime;
			if(parcent<0)
				parcent = 0;
			else if(parcent >1)
				parcent = 1;
			_roleskin.Pro_bar.value = parcent*_roleskin.Pro_bar.maximum;
			
			if(now>=_endRunTime)
			{
				setEndHandler();
			}
		}
		private var _isRandomEnd:Boolean;
		public function setEndHandler():void
		{
			_isRandomEnd = true;
			_roleskin.btnRandom.isEnabled = false;
			_currentFun = runRemoveHandler;
			_endRunTime = SystemTimeManager.curtTm+DURATION_REMOVE_TIME;
		}
		private function runRemoveHandler():void
		{
			if(SystemTimeManager.curtTm < _endRunTime)
				return ;
			closeHander();
		}
		
		private function closeHander():void
		{
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
			StarlingLayerManager.hintUILayer.removeChild(this,true);
		}
	}
}