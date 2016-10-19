package com.rpgGame.app.ui.main.rank
{
	import com.rpgGame.core.utils.NumberFormatter;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.rank.BossHurtRankItemData;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.mainui.rank.HurtRankListItemRenderSkin;
	
	/**
	 * 伤害排行list 
	 * @author 陈鹉光
	 * 
	 */	
	public class HurtRankListItem extends DefaultListItemRenderer
	{
		private var _skin:HurtRankListItemRenderSkin;
		
		public function HurtRankListItem()
		{
			super();
		}
		
		override protected function initialize() : void
		{
			super.initialize();
			_skin = new HurtRankListItemRenderSkin();
			_skin.toSprite(this);
		}
		
		override public function get height() : Number
		{
			if (_skin)
				return _skin.height;
			return 0;
		}
		
		override protected function commitData() : void
		{
			_skin.imageNumber.visible = false;
			_skin.lbNumber.visible = false;
			
			var rankData : BossHurtRankItemData = _data as BossHurtRankItemData;
			if ( rankData )
			{
				var color:uint = StaticValue.COLOR_CODE_1;
				switch( index )
				{
					case 0:
						color = StaticValue.Q_YELLOW;
						_skin.imageNumber.visible = true;
						_skin.lbNumber.visible = false;
						_skin.imageNumber.styleName = ClientConfig.getRankChar( rankData.rankIndex );
						break;
					case 1:
						color = StaticValue.Q_PURPLE;
						_skin.imageNumber.visible = true;
						_skin.lbNumber.visible = false;
						_skin.imageNumber.styleName = ClientConfig.getRankChar( rankData.rankIndex );
						break;
					case 2:
						color = StaticValue.COLOR_CODE_17;
						_skin.imageNumber.visible = true;
						_skin.lbNumber.visible = false;
						_skin.imageNumber.styleName = ClientConfig.getRankChar( rankData.rankIndex );
						break;
					default:
						_skin.imageNumber.visible = false;
						_skin.lbNumber.visible = true;
						_skin.lbNumber.htmlText = HtmlTextUtil.getTextColor( color, rankData.rankIndex + "" );
						break;
				}
				_skin.lbName.htmlText = HtmlTextUtil.getTextColor( color, rankData.heroName );
				_skin.lbHurting.htmlText = HtmlTextUtil.getTextColor( color, NumberFormatter.format( rankData.currHurt, ["万"], [10000], 1 ) );
			}
			else
			{
				_skin.lbNumber.text = "";
				_skin.lbName.text = "";
				_skin.lbHurting.text = "";
			}
			
			_skin.itemBg.alpha = (index % 2 == 0 ? 0 : 1); //不要用visible，需要交互！
		}
		
		override public function dispose() : void
		{
			_skin = null;
			super.dispose();
		}
		
	}
}