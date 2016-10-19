package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.friend.EnemyInfo;
	import com.rpgGame.coreData.info.friend.FriendBaseInfo;
	import com.rpgGame.coreData.info.friend.FriendInfo;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.tips.FriendHeroTipsSkin;


	/**
	 * 好友TIPS
	 * @author luguozheng
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-11-9 上午10:05:12
	 *
	 */
	public class FriendHeroTips extends SkinUI implements ITip
	{
		private var _tipsSkin : FriendHeroTipsSkin;

		public function FriendHeroTips()
		{
			_tipsSkin = new FriendHeroTipsSkin();
			super(_tipsSkin);
		}

		public function setTipData(data : *) : void
		{
			var friendInfo : FriendBaseInfo = data as FriendBaseInfo;
			if(!friendInfo)
				return;
			_tipsSkin.xinqin.text = friendInfo.mood;
			if(data is FriendInfo)
			{
				//好友
				var friend : FriendInfo = data as FriendInfo;
				if(friend)
					_tipsSkin.haoyoudu.htmlText = "好友度:"+friend.friendDegree;
				else
					_tipsSkin.haoyoudu.htmlText = "好友度:0";
				_tipsSkin.isFriend.styleName = AssetUrl.FIRNED_ICON;
				_tipsSkin.imgBG.height = 75+_tipsSkin.xinqin.height;
			}else if(data is EnemyInfo)
			{
				//仇人
				_tipsSkin.isFriend.styleName = AssetUrl.ENEMY_ICON;
				var enemy:EnemyInfo = data as EnemyInfo;
				if(enemy)
					_tipsSkin.haoyoudu.htmlText = "战绩:"+ HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_16,enemy.winTime+"")+"胜"+"     "+ HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_16,enemy.failTime+"")+"败";
				else
					_tipsSkin.haoyoudu.htmlText = "";
				_tipsSkin.imgBG.height = 93;
			}
			_tipsSkin.labName.text = friendInfo.name;
			_tipsSkin.level.text = friendInfo.level + "级";
			_tipsSkin.labLine.text = friendInfo.isOnLine ? "[在线]" : "[离线]";
			if(friendInfo.isOnLine)
				_tipsSkin.tipsGroup.filter = null;
			else
				_tipsSkin.tipsGroup.filter = FilterUtil.getGrayFilter();
		}

		public function hideTips() : void
		{
		}

		public override function get height() : Number
		{
			return _tipsSkin.imgBG.height;
		}

		private static var _instance : FriendHeroTips = null;

		public static function get instance() : FriendHeroTips
		{
			if (null == _instance)
			{
				_instance = new FriendHeroTips();
			}
			return _instance;
		}
	}
}
