package
{
	import com.game.engine3D.manager.Stage3DLayerManager;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;

	import game.rpgGame.login.util.RandomNick;
	import game.rpgGame.login.view.CreateHeroPanel;

	/**
	 * 创建角色
	 * @author 卢国征
	 *
	 */
	public class Login extends Sprite
	{
		/** 角色名字面板 **/
		private var _creatCharacterPanel : CreateHeroPanel;
		/** 发送选择玩家的回调 **/
		public var sendRegisterRole : Function;
		public var showInfoAlert : Function;

		public function Login()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStatge);
		}

		/**
		 * 初始化
		 * @param event
		 *
		 */
		private function onAddToStatge(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStatge);
			_creatCharacterPanel = new CreateHeroPanel(Stage3DLayerManager.starlingLayer.getLayer("login"), onCreateChar, onShowInfoAlert);
		}

		/**
		 * 设置名字库配置
		 * @param $config
		 * @author 卢国征
		 */
		public function setConfig($config : Dictionary) : void
		{
			var lang : Object;
			lang = $config["PLAYER_LAST_NAME"];
			var lastNameStr : String = lang ? lang.value : "";
			lang = $config["SYMBOL_NAME"];
			var flagNameStr : String = lang ? lang.value : "";
			lang = $config["MALE_NAME"];
			var maleNameStr : String = lang ? lang.value : "";
			lang = $config["FEMALE_NAME"];
			var femaleNameStr : String = lang ? lang.value : "";

			RandomNick.setup(lastNameStr.split(","), flagNameStr.split(","), maleNameStr.split(","), femaleNameStr.split(","));
		}

		public function onCreateHeroFail(msg : String) : void
		{
			_creatCharacterPanel.setInfo(msg);
		}

		/**
		 * 创建角色
		 * @param e
		 * @author 卢国征
		 */
		private function onCreateChar() : void
		{
			if (sendRegisterRole != null)
				sendRegisterRole(_creatCharacterPanel.sex == 1, _creatCharacterPanel.face, _creatCharacterPanel.body, _creatCharacterPanel.nickName, _creatCharacterPanel.country);
		}

		private function onShowInfoAlert(info : String) : void
		{
			if (showInfoAlert != null)
				showInfoAlert(info);
		}

		public function destroy() : void
		{
			_creatCharacterPanel.destroy();
			_creatCharacterPanel = null;

			if (parent)
				parent.removeChild(this);
		}
	}
}
