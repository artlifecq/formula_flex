package org.mokylin.skin.app.task
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskHeroIcoListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgIco:feathers.controls.UIAsset;

		public var labCurTasking:feathers.controls.Label;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskHeroIcoListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 100;
			this.width = 100;
			this.elementsContent = [imgIco_i(),labName_i(),labCurTasking_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgIco_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIco = temp;
			temp.name = "imgIco";
			temp.height = 51;
			temp.width = 88;
			temp.x = 4;
			temp.y = 6;
			return temp;
		}

		private function labCurTasking_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurTasking = temp;
			temp.name = "labCurTasking";
			temp.text = "进行中..";
			temp.textAlign = "center";
			temp.color = 0x22A140;
			temp.width = 63;
			temp.x = 3;
			temp.y = 2;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xE59507;
			temp.width = 92;
			temp.x = 5;
			temp.y = 74;
			return temp;
		}

	}
}