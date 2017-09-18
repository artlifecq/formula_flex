package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.fulidating.Tips_Qiandao;
	
	public class SignTiQianTip extends SkinUI implements ITip
	{
		private var _skin:Tips_Qiandao;
		public function SignTiQianTip()
		{
			_skin=new Tips_Qiandao();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_skin.lbl_name.text="提前签到";		
			_skin.lbl_vip2.visible=false;
			_skin.lbl_vip3.visible=false;
			_skin.imgBG.height=115;
		}
		
		public function setTipData(data : *) : void
		{
			if(Mgr.vipMgr.vipLv==0) _skin.lbl_name0.htmlText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT_WEEK,"我的VIP等级:")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"无");
			else{
				var cfg:Q_vip=VipCfg.getVip(Mgr.vipMgr.vipLv);
				_skin.lbl_name0.htmlText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT_WEEK,"我的VIP等级:")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,cfg.q_vip_name);
			}
			_skin.lbl_miaoshu.htmlText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT_WEEK,"本月剩余提前签到天数:")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,Mgr.signMgr.signVO.strikeSignSum.toString());
			cfg=VipCfg.getVip(3);
			_skin.lbl_vip1.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,cfg.q_vip_name+"  ")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"可提前签到  ")+
				HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,VipCfg.getTIQianNum(3).toString());
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : SignTiQianTip = null;
		public static function get instance() : SignTiQianTip
		{
			if (null == _instance)
			{
				_instance = new SignTiQianTip();
			}
			return _instance;
		}
	}
}