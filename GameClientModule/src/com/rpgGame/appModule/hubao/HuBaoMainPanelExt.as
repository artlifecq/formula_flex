package com.rpgGame.appModule.hubao
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.HuBaoEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.NumberUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_convoy;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import away3d.events.Event;
	
	import feathers.controls.SkinnableContainer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hubao.HuBaoItem2_Skin;
	import org.mokylin.skin.app.hubao.HuBaoItem_Skin;
	import org.mokylin.skin.app.hubao.HuBao_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	public class HuBaoMainPanelExt extends SkinUIPanel
	{
		private var _skin:HuBao_Skin;
		
		private var _jiangliList:Vector.<SkinnableContainer>;
		private var _useItemId:int=0;
		private var _useNum:int=0;
		private var _maxnum:int=0;
		
		private var _chenhaoEftContaner1:Inter3DContainer;
		private var _chenhaoEftContaner2:Inter3DContainer;
		private var _chenhaoEftContaner3:Inter3DContainer;
		private var _chenhaoEftContaner4:Inter3DContainer;
		
		private var _moxing1:InterObject3D;
		private var _moxing2:InterObject3D;
		private var _moxing3:InterObject3D;
		private var _moxing4:InterObject3D;
		
		private var _chenhaoEft:InterObject3D;
		private var _diEft:InterObject3D;
		
		private var _tishiPanel:HuBaoTiShiPanelExt;
		
		private var _q_con:Q_convoy;
		
		private var timer:GameTimer;
		
		public function HuBaoMainPanelExt()
		{
			_skin=new HuBao_Skin();
			super(_skin);
			initView();
			timer=new GameTimer("HuBaoMainPanelExt",50,0,ontimer);
			timer.stop();
		}
		
		private function initView():void
		{
			_jiangliList=new Vector.<SkinnableContainer>();
			_jiangliList.push(_skin.jiangli_1);
			_jiangliList.push(_skin.jiangli_2);
			_jiangliList.push(_skin.jiangli_3);
			_jiangliList.push(_skin.jiangli_4);
			
			_chenhaoEftContaner1=new Inter3DContainer();
			_skin.grp1.addChild(_chenhaoEftContaner1);
			_chenhaoEftContaner2=new Inter3DContainer();
			_skin.grp2.addChild(_chenhaoEftContaner2);
			_chenhaoEftContaner3=new Inter3DContainer();
			_skin.grp3.addChild(_chenhaoEftContaner3);
			_chenhaoEftContaner4=new Inter3DContainer();
			_skin.grp4.addChild(_chenhaoEftContaner4);
			
			for(var i:int=1;i<=HuBaoData.msxLv;i++)
			{
				var q_convoy:Q_convoy=HuBaoData.getmodByLv(i);
				if(q_convoy){
					var obj:Array=HuBaoManager.instance().getJIangLiByLv(q_convoy);
					setJiangLi(_jiangliList[i-1],obj);
					showModle(q_convoy);
				}
			}
			_maxnum=q_convoy.q_day_times;
		}	
		
		private function setJiangLi(tar:SkinnableContainer,prize:Array):void
		{
			if(prize==null) return;
			if(prize.length == 2) 
			{
				tar.skin=new org.mokylin.skin.app.hubao.HuBaoItem_Skin();
				for(var i:int=0;i<prize.length;i++)
				{
					var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_36);		
					ico.selectImgVisible=false;	
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(prize[i].mod);
					FaceUtil.SetItemGrid(ico,itemInfo);				
					if(i==0){
						ico.bindBg((tar.skin as HuBaoItem_Skin).icon1);
						//						ico.y=(tar.skin as HuBaoItem_Skin).icon1.y;
						(tar.skin as HuBaoItem_Skin).container.addChild(ico);
						(tar.skin as HuBaoItem_Skin).container.addChild((tar.skin as HuBaoItem_Skin).lb1);
						var num:String=NumberUtil.getNumberTo(prize[i].num,true);
						(tar.skin as HuBaoItem_Skin).lb1.text=num;
					}
					else {
						ico.bindBg((tar.skin as HuBaoItem_Skin).icon2);
						//						ico.y=(tar.skin as HuBaoItem_Skin).icon2.y;
						(tar.skin as HuBaoItem_Skin).container.addChild(ico);
						(tar.skin as HuBaoItem_Skin).container.addChild((tar.skin as HuBaoItem_Skin).lb2);
						num=NumberUtil.getNumberTo(prize[i].num,true);
						(tar.skin as HuBaoItem_Skin).lb2.text=num;
					}
				}
			}
				
			else 
			{
				tar.skin=new org.mokylin.skin.app.hubao.HuBaoItem2_Skin();
				for( i=0;i<prize.length;i++)
				{
					ico=new IconCDFace(IcoSizeEnum.ICON_42);		
					ico.selectImgVisible=false;	
					itemInfo=ItemUtil.convertClientItemInfoById(prize[i].mod);
					FaceUtil.SetItemGrid(ico,itemInfo);
					if(i==0){
						ico.bindBg((tar.skin as HuBaoItem2_Skin).icon1);
						//						ico.y=(tar.skin as HuBaoItem2_Skin).icon1.y;
						(tar.skin as HuBaoItem2_Skin).container.addChild(ico);
						(tar.skin as HuBaoItem2_Skin).container.addChild((tar.skin as HuBaoItem2_Skin).lb1);
						num=NumberUtil.getNumberTo(prize[i].num,true);
						(tar.skin as HuBaoItem2_Skin).lb1.text=num;
					}
					else if(i==1){
						ico.bindBg((tar.skin as HuBaoItem2_Skin).icon2);
						ico.y=(tar.skin as HuBaoItem2_Skin).icon2.y;
						(tar.skin as HuBaoItem2_Skin).container.addChild(ico);
						(tar.skin as HuBaoItem2_Skin).container.addChild((tar.skin as HuBaoItem2_Skin).lb2);
						num=NumberUtil.getNumberTo(prize[i].num,true);
						(tar.skin as HuBaoItem2_Skin).lb2.text=num;
					}
					else{
						ico.bindBg((tar.skin as HuBaoItem2_Skin).icon3);
						//						ico.y=(tar.skin as HuBaoItem2_Skin).icon3.y;
						(tar.skin as HuBaoItem2_Skin).container.addChild(ico);
						(tar.skin as HuBaoItem2_Skin).container.addChild((tar.skin as HuBaoItem2_Skin).lb3);
						num=NumberUtil.getNumberTo(prize[i].num,true);
						(tar.skin as HuBaoItem2_Skin).lb3.text=num;
					}
				}
			}		
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.chk_ok:
					HuBaoManager.instance().iszidong = _skin.chk_ok.isSelected;
					break;
			}			
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show();
			_skin.btnTiSheng.addEventListener(Event.TRIGGERED,btnTiShengHandler);
			_skin.btnHuSong.addEventListener(Event.TRIGGERED,btnHuSongHandler);
			EventManager.addEvent(HuBaoEvent.HUBAO_UPDATEPINZHI,updateNowSelectBaoWu);
			EventManager.addEvent(HuBaoEvent.HUBAO_STAR,close);
			EventManager.addEvent(ItemEvent.ITEM_ADD,updateItem);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,updateItem);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,updateItem);
			
			updateShowUseItem();
			updateHuSongNum(HuBaoManager.instance().num);
			updateNowSelectBaoWu(HuBaoManager.instance().level);
		}
		
		override public function hide():void
		{
			super.hide();
			if(timer) timer.stop();
			if(_tishiPanel&&_tishiPanel.stage!=null){
				MCUtil.removeSelf(_tishiPanel);
				_tishiPanel=null;
			}
			_skin.btnTiSheng.removeEventListener(Event.TRIGGERED,btnTiShengHandler);
			_skin.btnHuSong.removeEventListener(Event.TRIGGERED,btnHuSongHandler);
			EventManager.removeEvent(HuBaoEvent.HUBAO_UPDATEPINZHI,updateNowSelectBaoWu);
			EventManager.removeEvent(HuBaoEvent.HUBAO_STAR,close);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,updateItem);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,updateItem);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,updateItem);
		}
		
		private function updateItem(info:ClientItemInfo):void
		{
			updateShowUseItem();
		}
		
		/**更新显示消耗材料数量*/
		private function updateShowUseItem():void
		{
			var name:String = ItemConfig.getItemName(_useItemId);
			var num:int = BackPackManager.instance.getItemCount(_useItemId);
			if(num >= _useNum)
				_skin.lbCaiLiao.htmlText = "消耗"+HtmlTextUtil.getTextColor(StaticValue.PURPLE_TEXT,name+"*"+_useNum)+
					HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"("+num+")");
			else
				_skin.lbCaiLiao.htmlText = "消耗"+HtmlTextUtil.getTextColor(StaticValue.PURPLE_TEXT,name+"*"+_useNum)+
					HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"("+num+")");
		}
		
		/**更新护送次数*/
		private function updateHuSongNum(num:int):void
		{
			if(num > 0)
				_skin.lbCiShu.htmlText = "剩余次数"+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"("+num+"/"+_maxnum+")");
			else
				_skin.lbCiShu.htmlText = "剩余次数"+HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"("+num+"/"+_maxnum+")");
		}
		
		/**显示模型*/
		private function showModle(q_con:Q_convoy):void
		{
			switch(q_con.q_girl_id)
			{
				case 1:
					_moxing1=new InterObject3D();
					var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(q_con.q_modleurl));
					data.forceLoad=true;//ui上的3d特效强制加载
					var unit : RenderUnit3D = _moxing1.addRenderUnitWith(data, 0);	
					var sp:Sprite=new Sprite();
					sp.graphics.beginFill(0xfefae7,0);
					sp.graphics.drawRect(0,0,190,250);
					sp.graphics.endFill();
					_chenhaoEftContaner1.addChild(sp);
					_moxing1.x=100;
					_moxing1.y=300;
					//					unit.setScale(2.5);
					unit.addUnitAtComposite(unit);
					_chenhaoEftContaner1.addChild3D(_moxing1);
					var tipStr:String=HuBaoManager.instance().gettipsText(q_con);
					TipTargetManager.show(sp, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
				case 2:
					_moxing2=new InterObject3D();
					data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(q_con.q_modleurl));
					data.forceLoad=true;//ui上的3d特效强制加载
					unit = _moxing2.addRenderUnitWith(data, 0);		
					sp=new Sprite();
					sp.graphics.beginFill(0xfefae7,0);
					sp.graphics.drawRect(0,0,190,250);
					sp.graphics.endFill();
					_chenhaoEftContaner2.addChild(sp);
					_moxing2.x=100;
					_moxing2.y=300;
					//					unit.setScale(2.5);
					unit.addUnitAtComposite(unit);
					_chenhaoEftContaner2.addChild3D(_moxing2);
					tipStr=HuBaoManager.instance().gettipsText(q_con);
					TipTargetManager.show(_chenhaoEftContaner2, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
				case 3:
					_moxing3=new InterObject3D();
					data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(q_con.q_modleurl));
					data.forceLoad=true;//ui上的3d特效强制加载
					unit = _moxing3.addRenderUnitWith(data, 0);		
					sp=new Sprite();
					sp.graphics.beginFill(0xfefae7,0);
					sp.graphics.drawRect(0,0,190,250);
					sp.graphics.endFill();
					_chenhaoEftContaner3.addChild(sp);
					_moxing3.x=100;
					_moxing3.y=300;
					//					unit.setScale(2.5);
					unit.addUnitAtComposite(unit);
					_chenhaoEftContaner3.addChild3D(_moxing3);
					tipStr=HuBaoManager.instance().gettipsText(q_con);
					TipTargetManager.show(_chenhaoEftContaner3, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
				case 4:
					_moxing4=new InterObject3D();
					data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(q_con.q_modleurl));
					data.forceLoad=true;//ui上的3d特效强制加载
					unit = _moxing4.addRenderUnitWith(data, 0);		
					sp=new Sprite();
					sp.graphics.beginFill(0xfefae7,0);
					sp.graphics.drawRect(0,0,190,250);
					sp.graphics.endFill();
					_chenhaoEftContaner4.addChild(sp);
					_moxing4.x=100;
					_moxing4.y=300;
					//					unit.setScale(2.5);
					unit.addUnitAtComposite(unit);
					_chenhaoEftContaner4.addChild3D(_moxing4);
					tipStr=HuBaoManager.instance().gettipsText(q_con);
					TipTargetManager.show(_chenhaoEftContaner4, TargetTipsMaker.makeSimpleTextTips(tipStr));
					break;
			}
		}
		
		/**更新当前选中的宝物*/
		private function updateNowSelectBaoWu(lv:int):void
		{
			_q_con=HuBaoData.getmodByLv(lv);
			var usearr:Array=JSONUtil.decode(_q_con.q_refresh_item);
			_useItemId=parseInt(usearr[0].mod);
			_useNum=parseInt(usearr[0].num);
			updateShowUseItem();
			clearChenHaoEff();		
			switch(lv)
			{
				case 1:
				{
					_chenhaoEft = _chenhaoEftContaner1.playInter3DAt(ClientConfig.getEffect(_q_con.q_nameurl),100,55,0);
					_diEft = _chenhaoEftContaner1.playInter3DAt(ClientConfig.getEffect("tx_ui_yabiao_xuanzhong"),100,320,0);
					_traget=_moxing1;
					break;
				}
				case 2:
				{
					_chenhaoEft = _chenhaoEftContaner2.playInter3DAt(ClientConfig.getEffect(_q_con.q_nameurl),100,55,0);
					_diEft = _chenhaoEftContaner2.playInter3DAt(ClientConfig.getEffect("tx_ui_yabiao_xuanzhong"),100,320,0);
					_traget=_moxing2;
					break;
				}
				case 3:
				{
					_chenhaoEft = _chenhaoEftContaner3.playInter3DAt(ClientConfig.getEffect(_q_con.q_nameurl),100,55,0);
					_diEft = _chenhaoEftContaner3.playInter3DAt(ClientConfig.getEffect("tx_ui_yabiao_xuanzhong"),100,320,0);
					_traget=_moxing3;
					break;
				}
				case 4:
				{
					_chenhaoEft = _chenhaoEftContaner4.playInter3DAt(ClientConfig.getEffect(_q_con.q_nameurl),100,55,0);
					_diEft = _chenhaoEftContaner4.playInter3DAt(ClientConfig.getEffect("tx_ui_yabiao_xuanzhong"),100,320,0);
					_traget=_moxing4;
					break;
				}			
			}
			timer.start();
		}
		
		private var _traget:InterObject3D;
		private function ontimer():void
		{
			if(_traget) _traget.baseObj3D.rotationY+=8;
		}
		
		private function clearChenHaoEff():void
		{
			timer.stop();
			_chenhaoEftContaner1.removeChild3D(_chenhaoEft);
			_chenhaoEftContaner1.removeChild3D(_diEft);
			_chenhaoEftContaner2.removeChild3D(_chenhaoEft);
			_chenhaoEftContaner2.removeChild3D(_diEft);
			_chenhaoEftContaner3.removeChild3D(_chenhaoEft);
			_chenhaoEftContaner3.removeChild3D(_diEft);
			_chenhaoEftContaner4.removeChild3D(_chenhaoEft);
			_chenhaoEftContaner4.removeChild3D(_diEft);
			_moxing1.baseObj3D.rotationY=0;
			_moxing2.baseObj3D.rotationY=0;
			_moxing3.baseObj3D.rotationY=0;
			_moxing4.baseObj3D.rotationY=0;
			if(_chenhaoEft != null)
			{
				_chenhaoEft.dispose();
				_chenhaoEft=null;
			}
			if(_diEft != null) {
				_diEft.dispose();
				_diEft=null;
			}
		}
		
		private function btnTiShengHandler(e:Event):void
		{
			var zidong:int=HuBaoManager.instance().iszidong?1:0;
			HuBaoSender.upCSRefreshGirlMessage(zidong);
		}
		
		private function btnHuSongHandler(e:Event):void
		{
			if(HuBaoManager.instance().ishuing) {
				HuBaoManager.instance().onwalkToNpc(_q_con.q_destination);
				close();
				return;
			}
			if(HuBaoManager.instance().isdouble==1) 
			{
				if(_tishiPanel&&_tishiPanel.stage!=null) return;
				_tishiPanel=HuBaoTiShiPanelExt.showPanelMiUtil();
				return;
			}
			var isnotice:int=HuBaoManager.instance().istishi?1:0;
			HuBaoSender.upCSConvoyGirlMessage(isnotice);
			close();
		}
		
		private function close():void
		{
			MCUtil.removeSelf(this);
			if(_tishiPanel&&_tishiPanel.stage!=null){
				MCUtil.removeSelf(_tishiPanel);
				_tishiPanel=null;
			}
			if(timer) timer.stop();
		}
	}
}