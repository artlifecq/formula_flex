package com.rpgGame.appModule.dungeon.genuine
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.ExitScenePanel;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.fuben.FuBenJieSuan_Shengli;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	public class DailyDungeonSuccessPanel extends ExitScenePanel
	{
		private var _skin:FuBenJieSuan_Shengli;
		private var _effectList:Vector.<StarEffect>;
		//private var _rewardIcons:Vector.<IconCDFace>;
		private var leftTime:int;
		private var icoListGroup:RewardGroup;
		public function DailyDungeonSuccessPanel():void
		{
			_skin = new FuBenJieSuan_Shengli();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_64,_skin.icon1,RewardGroup.ALIN_CENTER,4,10,6,true,3);
			
			_effectList = new Vector.<StarEffect>();
			_effectList.push(new StarEffect(_skin.xin1,0));
			_effectList.push(new StarEffect(_skin.xin2,1));
			_effectList.push(new StarEffect(_skin.xin3,2));
			/*_rewardIcons = new Vector.<IconCDFace>();
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_1,IcoSizeEnum.ICON_64,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_2,IcoSizeEnum.ICON_64,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_3,IcoSizeEnum.ICON_64,1,5,5));*/
			for each(var star:StarEffect in _effectList)
			{
				star.addEventListener(Event.COMPLETE,completeHandler);
			}
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var msg:SCDailyZoneRewardPanelInfoMessage = data as SCDailyZoneRewardPanelInfoMessage;
			if(msg ==null)
				return ;
			for each(var star:StarEffect in _effectList)
			{
				star.reset();
			}
			_skin.lbTime.visible = false;
			playEffect(msg.star);
			_skin.lbJingyan.text =msg.exp.toString();
			_skin.lbTongqian.text = msg.money.toString();			
			_skin.lbzhenqi.text = msg.zhenqi.toString();
			_skin.lbzhenqi.visible=_skin.lb_zhenqiName.visible=msg.zhenqi>0;
			icoListGroup.setRewardByItemInfo(msg.itemInfoList);
			tweenComplete();
			/*var itemlist:Vector.<ItemInfo> = msg.itemInfoList;
			var length:int = itemlist.length;
			var startX:Number = (_skin.width-70*length)/2-12;
			_rewardIcons =new Vector.<IconCDFace>();
			for(var i:int = 0;i<length;i++)
			{
				var grid:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_64);
				//				grid.setUrlBg( "ui/common/gezikuang/tubiaodikuang/64.png");
				this.addChild(grid);
				grid.x = startX+70*i;
				grid.y = 360;
				FaceUtil.SetItemGrid(grid,ItemUtil.convertClientItemInfo(itemlist[i]), true);
				_rewardIcons.push(grid);
			}*/
			
		}
		
		private function completeHandler(e:Event):void
		{
			var index:int = e.data as int;
			index++;
			if(index == _star)
			{
				
				return ;
			}
			_effectList[index].playEffect();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnOk:
					sendQuitDungeon();
					break;
			}
		}
		
		private var _star:int;
		private function playEffect(stat:int):void
		{
			_star = stat;
			for each(var star:StarEffect in _effectList)
			{
				star.reset();
			}
			_effectList[0].playEffect();
		}
		private function tweenComplete():void
		{
			_skin.lbTime.visible = true;
			leftTime=10;
			TimerServer.addLoop(updateTime,1000);
			_skin.lbTime.text=leftTime+"秒后自动退出";
		}
		
		private function updateTime():void
		{
			leftTime--;
			_skin.lbTime.text=leftTime+"秒后自动退出";
			if(leftTime<=0){
				sendQuitDungeon();
			}
		}
		private function sendQuitDungeon():void
		{
			TimerServer.remove(updateTime);
			icoListGroup.tweeRewardInBag();
			DungeonSender.reqQuitDungeon(sceneId);
			this.hide();
		}
		override public function hide() : void
		{
			super.hide();
			TimerServer.remove(updateTime);
			icoListGroup.clear();
			/*for each(var icon:IconCDFace in _rewardIcons)
			{
				icon.destroy();
			}
			_rewardIcons = null;*/
		}
	}
}