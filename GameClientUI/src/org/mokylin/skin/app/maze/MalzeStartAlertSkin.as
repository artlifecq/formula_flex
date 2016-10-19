package org.mokylin.skin.app.maze
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MalzeStartAlertSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var mazeAlert:feathers.controls.Label;

		public var mazeAlert0:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MalzeStartAlertSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 63;
			this.width = 423;
			this.elementsContent = [mazeAlert_i(),mazeAlert0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function mazeAlert0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mazeAlert0 = temp;
			temp.name = "mazeAlert0";
			temp.height = 30;
			temp.fontSize = 22;
			temp.text = "勇闯迷宫";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 423;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function mazeAlert_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mazeAlert = temp;
			temp.name = "mazeAlert";
			temp.height = 30;
			temp.fontSize = 22;
			temp.text = "勇闯迷宫";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 423;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}