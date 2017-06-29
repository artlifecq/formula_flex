package com.rpgGame.app.ui.tips
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.vip.Tips_VipSelect;
	
	public class VipMoTipExt extends SkinUI implements ITip
	{
		private static var _ins : VipMoTipExt = null;
		
		public static function get instance() : VipMoTipExt
		{
			if (!_ins)
			{
				_ins = new VipMoTipExt();
			}
			return _ins;
		}
		private var _skin:Tips_VipSelect;
		private var _labsArr:Array=[];
		private var _endTime:int;
		private var _timer:GameTimer;
		public function VipMoTipExt()
		{
			_skin=new Tips_VipSelect();
			super(_skin);
			MCUtil.removeSelf(_skin.lbGong);
			
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>0) 
			{
				_skin.lbTime.text=TextUtil.SecondToDHMS(left);
			}
			else
			{
				_timer.stop();
			}
		}
		
		public function setTipData(data:*):void
		{
			
			for each (var lab:Label in _labsArr) 
			{
				MCUtil.removeSelf(lab);
			}
			_skin.bg_huang.visible=false;
			_skin.bg_zi.visible=false;
			_skin.bg_lan.visible=false;
			var vipLv:int=data.data;
			var bg:UIAsset;
			if (vipLv==1) 
			{
				bg=_skin.bg_lan;
			}
			else if (vipLv==2) 
			{
				bg=_skin.bg_zi;
			}
			else
			{
				bg=_skin.bg_huang;
			}
			bg.visible=true;
			var qVip:Q_vip=VipCfg.getVip(vipLv);
			var startPt:Point=new Point(_skin.lbGong.x,_skin.lbGong.y);
			if (qVip) 
			{
				_skin.lbl_titile.text=ItemConfig.getItemName(qVip.q_mo_tokenID);
				_skin.lbl_titile.color=ItemConfig.getItemQualityColor(qVip.q_mo_tokenID);
				var qItem:Q_item=ItemConfig.getQItemByID(qVip.q_mo_tokenID);
				if (qItem&&qItem.q_att_type!=0) 
				{
					var hash:HashMap=AttValueConfig.getAttrHash(qItem.q_att_type);
					if (hash) 
					{
						var ret:Array=AttrUtil.showAttr(hash,this,_skin.lbGong,1,startPt,0,_skin.lbGong.height+2,"：",_labsArr);
						_labsArr=_labsArr.concat(ret);
					}
				}
			}
			_skin.lbTime.y=startPt.y;
			startPt.y+=_skin.lbTime.height+15;
			bg.height=startPt.y;
			_skin.lbDec.y=startPt.y;
			_skin.uiDi.y=startPt.y;
			
			_endTime=Mgr.vipMgr.endTime;
			if (!_timer) 
			{
				_timer=new GameTimer("VipMoTipExt");
				_timer.onUpdate=onTimer;
			}
			_timer.start();
			onTimer();
		}
		
		public function hideTips():void
		{
			if (_timer) 
			{
				_timer.stop();
				_timer.destroy();
				_timer=null;
			}
		}
	}
}