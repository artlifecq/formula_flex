package org.mokylin.skin.app.task
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskNameListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labState:feathers.controls.Label;

		public var labTaskName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskNameListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 310;
			this.elementsContent = [labTaskName_i(),labState_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labState = temp;
			temp.name = "labState";
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0x22A140;
			temp.width = 89;
			temp.x = 214;
			temp.y = 8;
			return temp;
		}

		private function labTaskName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskName = temp;
			temp.name = "labTaskName";
			temp.fontSize = 14;
			temp.text = "标签";
			temp.color = 0xE59507;
			temp.width = 158;
			temp.x = 4;
			temp.y = 8;
			return temp;
		}

	}
}