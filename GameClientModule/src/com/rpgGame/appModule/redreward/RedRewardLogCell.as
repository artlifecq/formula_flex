package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.redreward.bean.RedRewardLog;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.hongbao.HongBao_LogItem;
	import org.mokylin.skin.common.ItemBg;
	
	public class RedRewardLogCell extends DefaultListItemRenderer
	{
		public function RedRewardLogCell():void
		{
			super();
		}
		private var _skin:HongBao_LogItem
		override protected function initialize():void
		{
			_skin = new HongBao_LogItem();
			_skin.toSprite(this);
		}
		
		override protected function commitData():void
		{
			var info:RedRewardLog = this.data as RedRewardLog;
			if(info==null)
				return ;
			var time:String = TimeUtil.formatTimeToSpecString(info.time.fValue);
			var playerName:String = HtmlTextUtil.getTextColor(0x14a3f3,"["+info.playerName+"]");
			var reward:String = HtmlTextUtil.getTextColor(0xffea00,info.count.toString()+"礼金!");
			_skin.lbName.htmlText = LanguageConfig.replaceStr("[$]  $领取了红包,获得了:$礼金!",time,playerName,info.count.toString());
			var isshow:Boolean = this.index%2==0;
			ItemBg(_skin.bg.skin).bg1.visible = isshow;
			ItemBg(_skin.bg.skin).bg2.visible = !isshow;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}