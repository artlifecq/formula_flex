package com.rpgGame.coreData.info.country.country
{

	/**
	 *
	 * 禁卫军申请数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-22 上午10:30:12
	 *
	 */
	public class JinWeiApplicantData
	{
		public var id : Number;
		public var name : String;
		public var timeOut : Number;

		public function JinWeiApplicantData(id : Number, name : String, timeOut : Number)
		{
			this.id = id;
			this.name = name;
			this.timeOut = timeOut;
		}
	}
}
