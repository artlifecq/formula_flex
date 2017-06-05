package
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.gameClient.log.GameLog;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import game.rpgGame.login.ClientConfig;
	import game.rpgGame.login.data.CreateRoleData;
	import game.rpgGame.login.util.RandomNick;
	import game.rpgGame.login.view.CreateRolePanel;
	
	/**
	 * 创建角色
	 * @author 卢国征
	 *
	 */
	public class Login extends Sprite
	{
		/** 角色名字面板 **/
		private var _creatCharacterPanel : CreateRolePanel;
		/** 发送选择玩家的回调 **/
		public var sendRegisterRole : Function;
		public var showInfoAlert : Function;
        public var baseDir : String;
		
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
            ClientConfig.baseDir = baseDir;
            GameLog.addShow("Login::onAddToStatge::baseDir=" + ClientConfig.baseDir);
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStatge);
			
			_creatCharacterPanel=new CreateRolePanel(Stage3DLayerManager.starlingLayer.getLayer("login"),onCreateChar);
			
			//			_creatCharacterPanel = new CreateHeroPanel(Stage3DLayerManager.starlingLayer.getLayer("login"), onCreateChar, onShowInfoAlert);
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
		
		public function onCreateHeroFail(msg : *) : void
		{
//			_creatCharacterPanel.setInfo(msg);
			createErr();
		}
		public function createErr():void
		{
			if (_creatCharacterPanel) 
			{
				_creatCharacterPanel.toRandom();
				_creatCharacterPanel.resetBtn();
			}
		}
		/**
		 * 创建角色
		 * @param e
		 * @author 卢国征
		 */
		private function onCreateChar(data:CreateRoleData) : void
		{
				sendRegisterRole(data.sex, data.nickName, data.job);
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
