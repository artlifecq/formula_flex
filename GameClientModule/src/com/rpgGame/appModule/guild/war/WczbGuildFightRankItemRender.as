package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.netData.guildWar.bean.GuildWarGuildRank;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiMing_Item;
	
	/**
	 *王城争霸 帮会战斗力排行 
	 * @author dik
	 * 
	 */
	public class WczbGuildFightRankItemRender extends DefaultListItemRenderer
	{
		private var _skin:WangChengPaiMing_Item;
		
		public function WczbGuildFightRankItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new WangChengPaiMing_Item();
			_skin.toSprite(this);
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function commitData():void
		{
			if(_skin){
				if(_data){
					var info:GuildWarGuildRank=_data as GuildWarGuildRank;
					if(info){
						_skin.lbNo.text=info.rank.toString();
						_skin.lbBanghui.text=info.guildName.toString();
					}
				}
			}
		}
	}
}