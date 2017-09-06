package com.client.process
{
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	
	public class ClientInitProcess extends BaseProcess
	{
		public function ClientInitProcess()
		{
			super();
		}
		override public function getState() : String
		{
			return ProcessState.STATE_CLINET_INIT;
		}
		override public function startProcess():void
		{
			super.startProcess();
			ResLoadingView.instance.percent=(0.8);
			completeProcess();
		}
		
	}
}