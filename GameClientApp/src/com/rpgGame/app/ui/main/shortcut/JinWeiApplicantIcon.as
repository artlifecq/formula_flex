package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	
	import org.mokylin.skin.mainui.shortcut.MessageJinWeiApplicantIconSkin;

	/**
	 *
	 * 禁卫军申请消息图标
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-22 上午10:05:12
	 *
	 */
	public class JinWeiApplicantIcon extends MessageIconBase
	{
		private var _skin : MessageJinWeiApplicantIconSkin;
		private var _applicantData : CountryGovernmentPostData;

		public function JinWeiApplicantIcon()
		{
			_skin = new MessageJinWeiApplicantIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}

		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
//			var list : Array = CountryManager.getJinWeiApplicantList();
//			if (list && list.length > 0)
//			{
//				_applicantData = list[list.length - 1];
//				GameAlert.show(_applicantData.playerName + "请求加入禁卫军，是否同意？", "提示", joinSureCallback, joinCancelCallback);
//			}
			AppManager.showAppNoHide(AppConstant.CROWN_JIN_WEI_LIST_PANEL);
			
		}

		private function joinSureCallback() : void
		{
			if (!_applicantData)
				return;
			CountryManager.sendJinWeireply(_applicantData.id, true);
			_applicantData = null;
		}

		private function joinCancelCallback() : void
		{
			if (!_applicantData)
				return;
			CountryManager.sendJinWeireply(_applicantData.id, false);
			_applicantData = null;
		}
	}
}
