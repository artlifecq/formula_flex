package com.rpgGame.app.cmdlistener.yuMaQiShou
{
	import com.rpgGame.app.manager.YuMaQiShouManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.events.YuMaQiShouEvent;
	import com.rpgGame.coreData.lang.LangYuMaQiShou;
	
	import flash.geom.Point;
	
	import app.cmd.YuMaQiShouModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	/**
	 * 御马场/奇兽苑 消息侦听 
	 * @author 陈鹉光
	 * 
	 */	
	public class YuMaQiShouCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener( YuMaQiShouModuleMessages.S2C_BI_MA_WEN_ACTIVITY_BEGIN, onBiMaWenActivityBegin );
			SocketConnection_protoBuffer.addCmdListener( YuMaQiShouModuleMessages.S2C_GET_BI_MA_WEN_POS, onGetBiMaWenPos );
			SocketConnection_protoBuffer.addCmdListener( YuMaQiShouModuleMessages.S2C_GET_BI_MA_WEN_POS_FAIL, onGetBiMaWenPosFail );
			SocketConnection_protoBuffer.addCmdListener( YuMaQiShouModuleMessages.S2C_BI_MA_WEN_ACTIVITY_END, onBiMaWenActivityEnd );
			SocketConnection_protoBuffer.addCmdListener( YuMaQiShouModuleMessages.S2C_BI_MA_WEN_ACTIVITY_IS_UNDERWAY, onBiMaWenActivityIsUnderway );
			
			super.finish();
		}
		
		/**
		 * 御马场弼马温活动开启时，全服广播
		 */		
		private function onBiMaWenActivityBegin( buffer:ByteBuffer ):void
		{
			YuMaQiShouManager.isInActivity = true;
			NoticeManager.showNotify( LangYuMaQiShou.OPEN_ACTIVITY_DESC );
			EventManager.dispatchEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT );
		}
		
		/**
		 * 寻找弼马温位置成功
		 * varint32 x坐标
		 * varint32 y坐标
		 */
		private function onGetBiMaWenPos( buffer:ByteBuffer ):void
		{
			var posx:int = buffer.readVarint32();
			var posy:int = buffer.readVarint32();
			
			var point:Point = new Point( posx, posy );
			EventManager.dispatchEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_BI_MA_WEN_POS_EVENT, point );
		}
		
		/**
		 * 寻找弼马温位置失败，附带byte错误码
		 * 1.玩家当前不在御马场
		 * 2.弼马温活动已经结束了
		 */
		private function onGetBiMaWenPosFail( buffer:ByteBuffer ):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.showNotify( LangYuMaQiShou[ "GET_BI_MA_WEN_POS_FAIL_" + errID ] );
		}
		
		/**
		 * 御马场弼马温活动结束，关闭ui
		 */
		private function onBiMaWenActivityEnd( buffer:ByteBuffer ):void
		{
			YuMaQiShouManager.isInActivity = false;
			NoticeManager.showNotify( LangYuMaQiShou.OPEN_CLOSE_DESC );
			EventManager.dispatchEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT );
		}
		
		/**
		 * 上线的时候发这个消息，弼马温活动进行中
		 */
		private function onBiMaWenActivityIsUnderway( buffer:ByteBuffer ):void
		{
			YuMaQiShouManager.isInActivity = true;
			EventManager.dispatchEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT );
		}
	}
}