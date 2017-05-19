package com.rpgGame.appModule.dungeon.genuine
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	
	import org.mokylin.skin.app.fuben.FuBenJieSuan_Shengli;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	import utils.TimerServer;
	
	public class DailyDungeonSuccessPanel extends SkinUIPanel
	{
		private var _skin:FuBenJieSuan_Shengli;
		private var _effectList:Vector.<StarEffect>;
		private var _rewardIcons:Vector.<IconCDFace>;
		private var leftTime:int;
		public function DailyDungeonSuccessPanel():void
		{
			_skin = new FuBenJieSuan_Shengli();
			super(_skin);
			initView();
		}
		private function initView():void
		{
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
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
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
			var q_data:Q_daily_zone = DailyZoneCfgData.getZoneCfg(msg.dailyZoneId);

			var itemlist:Array ;
			if(msg.firstPass==1)
				itemlist= ItemUtil.jsonParseItemClientList(q_data.q_special_rewards_show); 
			else
				itemlist = new Array();
			var lists:Array = ItemUtil.jsonParse2ObjList(q_data.q_rewards_show);
			var item:ItemInfo;
			for(var index:int = 0;index<lists.length;index++)
			{
				if(lists[index]["mod"] == 1)
				{
					_skin.lbJingyan.text =lists[index]["num"];
				}else if(lists[index]["mod"] == 4){
					_skin.lbJingyan.text =lists[index]["num"];
				}else{
					item = new ItemInfo();
					item.itemModelId = lists[index]["mod"];
					item.num = lists[index]["num"];
					itemlist.push(ItemUtil.convertClientItemInfo(item));
				}
			}
			var length:int = itemlist.length;
			var startX:Number = (_skin.width-70*length)/2-12;
			_rewardIcons =new Vector.<IconCDFace>();
			for(var i:int = 0;i<length;i++)
			{
				var grid:IconCDFace = new IconCDFace(IcoSizeEnum.ICON_64);
				grid.setBg( GridBGType.GRID_SIZE_64,1 );
				grid.bgImage.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
				this.addChild(grid);
				grid.x = startX+70*i;
				grid.y = 347;
				FaceUtil.SetItemGrid(grid,itemlist[i], true);
				_rewardIcons.push(grid);
			}
			
		}
		
		private function completeHandler(e:Event):void
		{
			var index:int = e.data as int;
			index++;
			if(index == _star)
			{
				tweenComplete();
				return ;
			}
			_effectList[index].playEffect();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnOk:
					DungeonSender.reqQuitDungeon();
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
			if(leftTime<0){
				TimerServer.remove(updateTime);
				DungeonSender.reqQuitDungeon();
				this.onHide();
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			TimerServer.remove(updateTime);
			for each(var icon:IconCDFace in _rewardIcons)
			{
				this.removeChild(icon,true);
			}
			_rewardIcons = null;
		}
	}
}