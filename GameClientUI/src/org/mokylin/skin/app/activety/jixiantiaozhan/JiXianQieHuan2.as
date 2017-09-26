package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberQiehuannum;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianQieHuan2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpWord1:feathers.controls.Group;

		public var grpWord2:feathers.controls.Group;

		public var num1:feathers.controls.UINumber;

		public var num2:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianQieHuan2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 72;
			this.width = 669;
			this.elementsContent = [__JiXianQieHuan2_UIAsset1_i(),grpWord1_i(),grpWord2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianQieHuan2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/BOSSyibeijisha_bg1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiXianQieHuan2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/huodongjijiangjieshu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiXianQieHuan2_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/miaohoutuichuhuodongchangjing.png";
			temp.x = 239;
			temp.y = 0;
			return temp;
		}

		private function __JiXianQieHuan2_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/qingjinkuaishiquwupin.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiXianQieHuan2_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/miaohoutuichufuben.png";
			temp.x = 269;
			temp.y = 0;
			return temp;
		}

		private function grpWord1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpWord1 = temp;
			temp.name = "grpWord1";
			temp.visible = false;
			temp.x = 81;
			temp.y = 17;
			temp.elementsContent = [__JiXianQieHuan2_UIAsset2_i(),__JiXianQieHuan2_UIAsset3_i(),num1_i()];
			return temp;
		}

		private function grpWord2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpWord2 = temp;
			temp.name = "grpWord2";
			temp.x = 110;
			temp.y = 17;
			temp.elementsContent = [__JiXianQieHuan2_UIAsset4_i(),__JiXianQieHuan2_UIAsset5_i(),num2_i()];
			return temp;
		}

		private function num1_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num1 = temp;
			temp.name = "num1";
			temp.height = 25;
			temp.label = "15";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberQiehuannum;
			temp.textAlign = "center";
			temp.width = 55;
			temp.x = 190;
			temp.y = 4;
			return temp;
		}

		private function num2_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num2 = temp;
			temp.name = "num2";
			temp.height = 25;
			temp.label = "15";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberQiehuannum;
			temp.textAlign = "center";
			temp.width = 55;
			temp.x = 222;
			temp.y = 4;
			return temp;
		}

	}
}