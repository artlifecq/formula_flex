package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.GridOpenCfg;
	import com.rpgGame.coreData.clientConfig.Q_backpack_grid;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemGridUnlockInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.beibao.OpenGridTipSkin;
	
	import utils.TimerServer;
	
	/**
	 * 解锁物品格子tips 
	 * @author wewell@163.com
	 * 
	 */	
	public class OpenGridTip extends SkinUI implements ITip
	{
		private var _skin:OpenGridTipSkin;
		private var _info:ItemGridUnlockInfo;
		private var cdTime:Number;
		
		private var _icos:Vector.<IconCDFace>;
		private var _arr:Array=[1,4,2];
		
		public function OpenGridTip()
		{
			_skin = new OpenGridTipSkin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			var ico:IconCDFace;
			_icos=new Vector.<IconCDFace>();
			for(var i:int=0;i<3;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_36);
				ico.selectImgVisible=false;
				var ui:UIAsset=_skin.container.getChildByName("ico"+i) as UIAsset;
				ico.bindBg(ui);
				this._skin.container.addChild(ico);
				_icos.push(ico);
			}
		}
		
		protected override function onShow():void
		{
			super.onShow();
			if(_info)
			{
				TimerServer.remove(updateCdTime);
				cdTime = GoodsContainerMamager.getMrg(_info.containerID).unlockTime;
				updateCdTime();
				TimerServer.addLoop(updateCdTime,1000);
			}
		}
		
		public function setTipData( data:* ):void
		{
			_info = data as ItemGridUnlockInfo;
			var id:String=_info.id;
			var cfg:Q_backpack_grid=GridOpenCfg.getCfgById(id);
			var numArr:Array=[cfg.q_exp,cfg.q_maxmoney,cfg.q_maxvitalqi];
			for(var i:int=0;i<_icos.length;i++)
			{
				var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(_arr[i],numArr[i]);
				FaceUtil.SetItemGrid(_icos[i],itemInfo);
			}
			
			cdTime = GoodsContainerMamager.getMrg(_info.containerID).unlockTime;
			updateCdTime();
			TimerServer.addLoop(updateCdTime,1000);
		}
		
		private function updateCdTime():void
		{
			if(cdTime <= 0)
			{
				TimerServer.remove(updateCdTime);
				return;
			}
			_skin.lb_time.htmlText = TimeUtil.format3TimeType(cdTime--);
		}
		
		public function hideTips():void
		{
			TimerServer.remove(updateCdTime);
		}
		
		private static var _instance:OpenGridTip = null;
		public static function get instance() : OpenGridTip
		{
			if (null == _instance)
			{
				_instance = new OpenGridTip();
			}
			return _instance;
		}
		
	}
}