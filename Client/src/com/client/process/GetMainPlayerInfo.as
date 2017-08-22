package com.client.process
{
	import com.client.ClientConfig;
	import com.client.cmdlistener.LoginCmdListener;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.rpgGame.coreData.cfg.ClientConfig;

	public class GetMainPlayerInfo extends BaseProcess
	{
		public function GetMainPlayerInfo()
		{
			super();
		}
		
		override public function getState() : String
		{
			return ProcessState.GET_MAINPLAYER_INFO;
		}
		
		override public function startProcess() : void
		{
			super.startProcess();
			LoginCmdListener.onGetMyPlayerInfoHandler = onGetMyPlayerInfoHandler;
		}
		
		private function onGetMyPlayerInfoHandler():void
		{
//			SenderReferenceSet.start();
			completeProcess();
			if (ClientConfig.mainEntry)
			{
				ClientConfig.mainEntry.reEnterGame();
			}
		}
		
		override public function processHandler(percent : Number) : void
		{
			var isHangUp : Boolean = ProcessStateMachine.getInstance().preProcessIsHangUp(ProcessState.GET_MAINPLAYER_INFO);
			if (!isHangUp)
			{
				ResLoadingView.instance.percent = percent;
			}
		}
		
		override public function dispose() : void
		{
			super.dispose();
		}
	}
}