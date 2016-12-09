package com.rpgGame.app.sender
{
	import app.cmd.BiaoModuleMessages;

	public class BiaoJuSender extends BaseSender
	{
		public function BiaoJuSender()
		{
		}
		/**
		 * 请求镖局日志
		 */
		public static function biaoJuLog():void
		{
			_bytes.clear();
			send(BiaoModuleMessages.C2S_BIAO_JU_LOG,_bytes);
		}
		/**
		 * 开启镖局
		 *
		 * boolean true(开启)/false(关闭)
		 */
		public static function openBiaoJu(value:Boolean):void
		{
			_bytes.clear();
			_bytes.writeBoolean(value);
			send(BiaoModuleMessages.C2S_OPEN_BIAO_JU,_bytes);
		}
		
		/**
		 * 请求镖局数据,只有帮主才可以请求该消息
		 */
		public static function getBiaoJuData():void
		{
			_bytes.clear();
			send(BiaoModuleMessages.C2S_GET_BIAO_JU_DATA,_bytes);
		}
		/**
		 * 充入镖局资金
		 *
		 * varint32 充入额度
		 */
		public static function rechargeBiaoJuMoney(value:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(value);
			send(BiaoModuleMessages.C2S_RECHARGE_BIAO_JU_MONEY,_bytes);
		}
		/**
		 * 分配薪水
		 * <p>
		 * while(buffer.readable()){
		 * varint64 玩家id
		 * varint32 薪水,该值必须>0
		 * }
		 */
		public static function fenPeiSilver(array:Array):void
		{
//			_bytes.clear();
//			for each(var biaojuOffice : BiaoJuOfficeData in array)
//			{
//				if(biaojuOffice.silver>0)
//				{
//					_bytes.writeVarint64(biaojuOffice.id);
//					_bytes.writeVarint32(biaojuOffice.silver);
//				}
//			}
//			send(BiaoModuleMessages.C2S_ALLOCATE_SALARY,_bytes);
		}
	}
}