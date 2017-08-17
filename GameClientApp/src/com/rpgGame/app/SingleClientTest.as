package com.rpgGame.app
{
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.coreData.info.task.TaskChapterInfo;
	import com.rpgGame.coreData.info.task.TaskInfo;

	public class SingleClientTest
	{
		public function SingleClientTest()
		{
		}

		public static function createRoleData() : void
		{
			/**
			 * 任务数据
			 * */
			
			TaskManager.currentChapterInfo = new TaskChapterInfo();
			TaskManager.currentChapterInfo.order = 0;
			TaskManager.mainLineTaskInfo = new TaskInfo();
			/** 地图传送点数据 **/ //临时的\
//			var areaInfo1:AreaDataProto = new AreaDataProto();
//			areaInfo1.id = 1;
//			areaInfo1.sceneId = 6;
//			areaInfo1.areaName = "进入测试";
//			areaInfo1.centerX = 0;
//			areaInfo1.centerY = 0;
//			areaInfo1.pos = [6232,-2942,6142,-3223,6648,-3255,6745,-2923];
//			
//			var areaInfo2:AreaDataProto = new AreaDataProto();
//			areaInfo2.id = 2;
//			areaInfo2.sceneId = 6;
//			areaInfo2.areaName = "传送测试";
//			areaInfo2.centerX = 0;
//			areaInfo2.centerY = 0;
//			areaInfo2.pos = [6053,-3723,6458,-3744,6548,-3422,6144,-3377];
//			
//			var transports:SceneTransportsProto = new SceneTransportsProto();
//			
//			var transport:SceneTransportProto = new SceneTransportProto();
//			transport.id = 1;
//			transport.canTransportCountry = 0;
//			transport.sourceCountry = 0
//			transport.sourceAreaData=areaInfo2;
//			transport.destCountry=0
//			transport.destSceneData=1;
//			transport.res = "tx_chuansongmen_03";
//			transport.resDirection=0;
//			transport.resX=1000;
//			transport.resY=-1000;
//			transport.showInSmallMapType=0;
//			transport.resOffsetUp=0;
//			transport.scale = 0;
//			
//			transports.tranport.push(transport);
//			
//			TranportsDataManager.setConfig(transports);
		}
	}
}
