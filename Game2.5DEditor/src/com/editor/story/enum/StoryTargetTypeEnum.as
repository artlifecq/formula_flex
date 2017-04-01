package com.editor.story.enum
{
	import com.editor.enum.rEnum;

	public class StoryTargetTypeEnum
	{
		public static const CAMERA:int = rEnum.ENUM_START(1);
		public static const ROLE:int = rEnum.next;
		public static const EFFECT:int = rEnum.next;
		public static const TEXT:int = rEnum.next;
		public static const SOUND:int = rEnum.next;
		public static const ROLE_INFO:int = rEnum.next;
		public static const ROLE_CONTROL:int = rEnum.next;
		public static const END:int = rEnum.next;
	}
}