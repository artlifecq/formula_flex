package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	
	import org.mokylin.skin.app.vip.Tips_Vip;
	
	public class VipNoneTipExt extends SkinUI implements ITip
	{
		private var _skin:Tips_Vip;
		public function VipNoneTipExt()
		{			
			_skin=new Tips_Vip();
			super(_skin);
		}
		
		public function setTipData(data:*):void
		{
			var info:Q_tipsinfo=data as Q_tipsinfo;
			if(info){
				_skin.lbName.htmlText=info.q_describe_tittle;
				_skin.lbCont1.htmlText=info.q_describe;
				_skin.lbCont2.htmlText=info.q_source;
				if(_skin.lbCont1.textWidth>_skin.lbCont2.textWidth){
					_skin.imgBG.width=_skin.lbCont1.textWidth+15;
				}else{
					_skin.imgBG.width=_skin.lbCont2.textWidth+15;
				}
			}else{
				_skin.lbName.htmlText="数据异常，查查配置表";
				_skin.lbCont1.htmlText="";
				_skin.lbCont2.htmlText="";
			}
		}
		
		public function hideTips():void
		{
		}
		
		private static var _ins : VipNoneTipExt = null;
		public static function get instance() : VipNoneTipExt
		{
			if (!_ins)
			{
				_ins = new VipNoneTipExt();
			}
			return _ins;
		}
	}
}