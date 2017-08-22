package com.rpgGame.app.ui.roll
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MapEvent;
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
	
	import away3d.events.Event;
	
	import feathers.data.ListCollection;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.roll.Roll_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	
	public class RollPane extends SkinUI implements IAnimatable
	{
		private var stopTimes:Array=[0,4,1,1.84,3.377,4.774];//1,2,4,5,6,2
		
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
			_roleskin = new Roll_Skin();
			super(_roleskin);
			init();	
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
			if(_roleItem.tempItemInfo.mod==0)
			{
				trace("ROLL点数据有误······道具MODID不应该为0啊");
				return;
			}
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
			_roleskin.btnRandom.alpha=0;
			
			this.playInter3DAt(ClientConfig.getEffect("ui_shaizi"),_roleskin.btnRandom.x+14,_roleskin.btnRandom.y+15,0,null,addComple);
			
			updateView();
		}
		
		private function addComple(render:RenderUnit3D):void
		{
			this.saiziRender=render;
			var scale:Number=0.3;
			this.saiziRender.scaleX=scale
			this.saiziRender.scaleY=scale;
			this.saiziRender.scaleZ=scale;
			saiziRender.play(0);
		}
		
		private function randomclickHandler():void
		{
			if(_isRandomEnd)
				return ;
			DropGoodsManager.getInstance().reqRollPoint(_roleItem);
			_roleskin.btnRandom.alpha=1;
			_roleskin.btnRandom.isEnabled = false;
			if(saiziRender){
				saiziRender.stop();
			}
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
			_roleskin.Pro_bar.maximum=DurationTime;
			_roleskin.Pro_bar.value=(_endRunTime -now);			
			if(now>=_endRunTime)
			{
				setEndHandler();
			}
		}
		private var _isRandomEnd:Boolean;
		private var saiziRender:RenderUnit3D;
		public function setEndHandler():void
		{
			_isRandomEnd = true;
			_roleskin.btnRandom.isEnabled = false;
			_currentFun = runRemoveHandler;
			_endRunTime = SystemTimeManager.curtTm+DURATION_REMOVE_TIME;
			var stopTime:Number=stopTimes[int(Math.random()*6)];
			saiziRender.stop(stopTime);
			_roleskin.btnRandom.visible=false;
		}
		private function runRemoveHandler():void
		{
			if(SystemTimeManager.curtTm < _endRunTime)
				return ;
			closeHander();
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
		}
		
		private function onSwitchCmp():void
		{
			// TODO Auto Generated method stub
			closeHander();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			_roleItem=null;
			_endRunTime=0;
			if(saiziRender){
				saiziRender.stop();
				saiziRender.dispose();
//				this.saiziRender.visible=false;
			}
			_roleskin.btnRandom.visible=true;
		}
		
		private function closeHander():void
		{
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
			StarlingLayerManager.hintUILayer.removeChild(this,true);
		}
	}
}