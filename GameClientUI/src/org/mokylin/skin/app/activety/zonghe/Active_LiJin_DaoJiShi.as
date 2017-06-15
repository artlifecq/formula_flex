package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberDaojishi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJin_DaoJiShi extends feathers.controls.StateSkin
	{
		public var numTime:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJin_DaoJiShi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 94;
			this.width = 694;
			this.elementsContent = [__Active_LiJin_DaoJiShi_UIAsset1_i(),__Active_LiJin_DaoJiShi_UIAsset2_i(),numTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJin_DaoJiShi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/wenzibg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJin_DaoJiShi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/shuaxinxiayibo.png";
			temp.x = 111;
			temp.y = 28;
			return temp;
		}

		private function numTime_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numTime = temp;
			temp.name = "numTime";
			temp.gap = -1;
			temp.height = 38;
			temp.label = "3";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberDaojishi;
			temp.textAlign = "right";
			temp.width = 66;
			temp.x = 46;
			temp.y = 26;
			return temp;
		}

	}
}