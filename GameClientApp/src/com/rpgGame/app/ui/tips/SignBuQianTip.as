package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.fulidating.Tips_Qiandao;
	
	public class SignBuQianTip extends SkinUI implements ITip
	{
		private var _skin:Tips_Qiandao;
		public function SignBuQianTip()
		{
			_skin=new Tips_Qiandao();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.lbl_name.text="补签";		
		}
		
		public function setTipData(data : *) : void
		{
			if(Mgr.vipMgr.vipLv==0) _skin.lbl_name0.htmlText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT_WEEK,"我的VIP等级:")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"无");
			else{
				var cfg:Q_vip=VipCfg.getVip(Mgr.vipMgr.vipLv);
				_skin.lbl_name0.htmlText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT_WEEK,"我的VIP等级:")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,cfg.q_vip_name);
			}
			_skin.lbl_miaoshu.htmlText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT_WEEK,"本月剩余补签天数:")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,Mgr.signMgr.signVO.signAddNum.toString());
			for(var i:int=1;i<4;i++){
				cfg=VipCfg.getVip(i);
				var lab:Label=_skin.container.getChildByName("lbl_vip"+i) as Label;
				lab.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,cfg.q_vip_name+"  ")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"可补签  ")+
					HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,VipCfg.getBuQianNum(i).toString());
			}
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : SignBuQianTip = null;
		public static function get instance() : SignBuQianTip
		{
			if (null == _instance)
			{
				_instance = new SignBuQianTip();
			}
			return _instance;
		}
	}
}