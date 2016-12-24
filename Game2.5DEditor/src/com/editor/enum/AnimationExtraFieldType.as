package com.editor.enum
{
	import flash.utils.Dictionary;

	/**
	 *
	 * 动作额外数据字段类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-22 下午3:03:17
	 *
	 */
	public class AnimationExtraFieldType
	{
		//caromStartFrameTime
		public static const carom_start_frame_time : String = "carom_start_frame_time";
		//hitFrameTime
		public static const hit_frame_time : String = "hit_frame_time";
		//breakFrameTime
		public static const break_frame_time : String = "break_frame_time";
		//soarFrameTime
		public static const soar_frame_time : String = "soar_frame_time";
		//throwFrameTime
		public static const throw_frame_time : String = "throw_frame_time";

		public static var fieldLabelByType : Dictionary = new Dictionary();
		fieldLabelByType[carom_start_frame_time] = "连招起手帧时间";
		fieldLabelByType[hit_frame_time] = "判定帧时间";
		fieldLabelByType[break_frame_time] = "可打断帧时间";
		fieldLabelByType[soar_frame_time] = "腾飞帧时间";
		fieldLabelByType[throw_frame_time] = "投射帧时间";

		public static function get fieldList() : Array
		{
			return [carom_start_frame_time, //
				hit_frame_time, //
				break_frame_time, //
				soar_frame_time, //
				throw_frame_time];
		}

		public function AnimationExtraFieldType()
		{
		}
	}
}
