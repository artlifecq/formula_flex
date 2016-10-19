package org.mokylin.skin.app.equip
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipGeneralStatLineSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var statAdd:feathers.controls.Label;

		public var statName:feathers.controls.Label;

		public var taozCount:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipGeneralStatLineSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 240;
			this.elementsContent = [statName_i(),statAdd_i(),taozCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function statAdd_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			statAdd = temp;
			temp.name = "statAdd";
			temp.height = 20;
			temp.color = 0x239D02;
			temp.width = 79;
			temp.x = 51;
			temp.y = 0;
			return temp;
		}

		private function statName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			statName = temp;
			temp.name = "statName";
			temp.height = 20;
			temp.color = 0xD4C996;
			temp.width = 232;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function taozCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			taozCount = temp;
			temp.name = "taozCount";
			temp.height = 20;
			temp.textAlign = "right";
			temp.width = 79;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

	}
}