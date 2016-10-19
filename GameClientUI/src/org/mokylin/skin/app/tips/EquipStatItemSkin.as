package org.mokylin.skin.app.tips
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipStatItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var contrastLbl:feathers.controls.Label;

		public var statLbl:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipStatItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 280;
			this.elementsContent = [statLbl_i(),contrastLbl_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function contrastLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			contrastLbl = temp;
			temp.name = "contrastLbl";
			temp.text = "对比";
			temp.textAlign = "right";
			temp.width = 98;
			temp.x = 181;
			temp.y = 2;
			return temp;
		}

		private function statLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			statLbl = temp;
			temp.name = "statLbl";
			temp.text = "基础";
			temp.width = 154;
			temp.x = 6;
			temp.y = 2;
			return temp;
		}

	}
}