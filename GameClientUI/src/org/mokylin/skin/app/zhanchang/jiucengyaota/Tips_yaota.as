package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_yaota extends feathers.controls.StateSkin
	{
		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_yaota()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__Tips_yaota_Label1_i(),__Tips_yaota_Label2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_yaota_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "活动规则：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 8;
			temp.y = 7;
			return temp;
		}

		private function __Tips_yaota_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 169;
			temp.htmlText = "1.每层击杀玩家和怪可获得战场积分，积分达到一定数量可进入下一层。<br>2.安全层<font color='#5DBD37'>(1、2、3、4)</font>死亡复活点复活不会降层；非安全层<font color='#5DBD37'>(5、6、7、8、9)</font>有几率降<br>  前一层。原地复活不会降层。<br>3.进入第九层可争夺封魔战旗，每<font color='#5DBD37'>5</font>分钟刷新一面封魔战旗，玩家采集后可持有战旗。<br>4.持有战旗的玩家可获得BUFF。<br>5.击杀持有战旗的玩家，击杀者成为新的战旗持有者。<br>6.<font color='#5DBD37'>5</font>分钟倒计时结束时，持有封魔战旗的玩家将获得镇妖宝箱，同时场景中刷新一面新<br>  的封魔战旗。";
			temp.leading = 7;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 533;
			temp.x = 8;
			temp.y = 28;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 200;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 545;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}