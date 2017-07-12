package com.rpgGame.app.ui.main.hubaozhuizong
{
	
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_convoy;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import gs.TweenMax;
	
	import org.mokylin.skin.app.hubao.HuBao_ZhuiZong;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	public class HuBaoTracjerBar extends SkinUI
	{
		private var _skin:HuBao_ZhuiZong;
		private var _remainTime:int=0;
		private var barTweenMax:TweenMax;
		private var initX:Number;
		
		private var _beijingkuangList:Vector.<UIAsset>;
		private var _icoList:Vector.<IconCDFace>;
		private var _labList:Vector.<Label>;
		private var _q_con:Q_convoy;
		public function HuBaoTracjerBar()
		{
			_skin=new HuBao_ZhuiZong();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			initX=_skin.task_box.x;
			_beijingkuangList=new Vector.<UIAsset>();
			_beijingkuangList.push(_skin.sec_ico1_0);
			_beijingkuangList.push(_skin.sec_ico1_1);
			_beijingkuangList.push(_skin.sec_ico1_2);
			
			_icoList=new Vector.<IconCDFace>();
			for(var i:int=0;i<_beijingkuangList.length;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_42);		
				ico.selectImgVisible=false;
				_icoList.push(ico);
				ico.bindBg(_beijingkuangList[i]);
//				ico.y=_beijingkuangList[i].y-4;
				_skin.scroll_box.addChild(ico);
			}		
			_labList=new Vector.<Label>();
			_labList.push(_skin.lb1);
			_labList.push(_skin.lb2);
			_labList.push(_skin.lb3);
			_skin.scroll_box.addChild(_skin.lb1);
			_skin.scroll_box.addChild(_skin.lb2);
			_skin.scroll_box.addChild(_skin.lb3);
		}
		
		override protected function onShow() : void
		{
			super.onShow();	
			//			EventManager.addEvent(HuBaoEvent.HUBAO_ZHUIZONG,updatePanel);
			updatePanel();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			TimerServer.remove(updateTime);
			//			EventManager.removeEvent(HuBaoEvent.HUBAO_ZHUIZONG,updatePanel);
		}
		
		private function updatePanel():void
		{
			_remainTime=HuBaoManager.instance().time;
//			switch(HuBaoManager.instance().level)
//			{
//				case 1:
//					_skin.icons.styleName = "ui/app/hubao/icon/inlvyi.png";
//					break;
//				case 2:
//					_skin.icons.styleName = "ui/app/hubao/icon/inlvyi.png";
//					break;
//				case 3:
//					_skin.icons.styleName = "ui/app/hubao/icon/inlvyi.png";
//					break;
//				case 4:
//					_skin.icons.styleName = "ui/app/hubao/icon/inlvyi.png";
//					break;
//			}
			_q_con=HuBaoData.getmodByLv(HuBaoManager.instance().level);
			_skin.lbName.text=_q_con.q_girl_level;
			var q_scene_monsnter:Q_scene_monster_area=MonsterDataManager.getAreaByAreaID(_q_con.q_destination);
			var mapname:String=MapDataManager.getMapName(q_scene_monsnter.q_mapid);
			var npcName:String=MonsterDataManager.getMonsterName(q_scene_monsnter.q_monster_model);
			_skin.lbTaget.text=mapname+"-"+npcName;
			_skin.lbTime.text=TimeUtil.format3TimeType(_remainTime);
			TimerServer.addLoop(updateTime,1000);
			
			for(var i:int=0;i<_beijingkuangList.length;i++)
			{
				if(i<HuBaoManager.instance().prize.length)
				{
					var itemInfo:ClientItemInfo=new ClientItemInfo(HuBaoManager.instance().prize[i].itemModelId);
					FaceUtil.SetItemGrid(_icoList[i],itemInfo);
					_beijingkuangList[i].visible=true;
					_icoList[i].visible=true;
					_labList[i].text=HuBaoManager.instance().prize[i].num.toString();
					_labList[i].visible=true;
				}
				else
				{
					_beijingkuangList[i].visible=false;
					_icoList[i].visible=false;
					_labList[i].visible=false;
				}
			}
			doFindNpcWork();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case this._skin.btn_open:
					// 打开
					setState(true);
					break;
				case this._skin.btn_close:
					// 关闭
					setState(false);
					break;
				case _skin.ico_chenhao:
				case _skin.lbTaget:
					doFindNpcWork();
					break;
			}
		}
		
		/**追踪栏开启关闭操作*/
		private function setState(isOpen : Boolean) : void {
			if (barTweenMax) {
				barTweenMax.kill();
			}
			var targetX : int;
			_skin.task_box.visible=true;
			if(isOpen)
			{
				targetX=initX;
				barTweenMax=TweenMax.to(_skin.task_box,0.5,{x:targetX});
			}
			else
			{
				targetX=initX+_skin.task_box.width;
				barTweenMax=TweenMax.to(_skin.task_box,0.5,{x:targetX,onComplete :onCompFun});
			}
			
			
			_skin.btn_close.visible = isOpen;
			_skin.btn_open.visible = !isOpen;
		}
		
		private function onCompFun() : void 
		{
			_skin.task_box.visible=false;
		}
		
		private function doFindNpcWork():void
		{
			HuBaoManager.instance().onwalkToNpc(_q_con.q_destination);
		}
		
		private function updateTime():void
		{
			_remainTime--;
			_skin.lbTime.text=TimeUtil.format3TimeType(_remainTime);
			if(_remainTime==0){
				TimerServer.remove(updateTime);
				//				MCUtil.removeSelf(this);
			}
		}
		
		public function resize(w : int, h : int) : void {
			this.x = w - this._skin.width;
			this.y = (h - this._skin.height)>>1;
			CONFIG::netDebug{
				NetDebug.LOG("[HuBaoTracjerBar] [resize] x:" + this.x + ", y:" + this.y + ", w:" + this._skin.width + ", h:" + this._skin.height);
			}
		}
	}
}