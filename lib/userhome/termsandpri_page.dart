import 'package:flutter/material.dart';

class TermsandPrivacy extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TermsandPrivacy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Last updated: December 12, 2023",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "This Privacy Policy describes Our policies and procedures on the collection, use, and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            // Interpretation and Definitions
            Text(
              "Interpretation and Definitions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Interpretation
            Text(
              "Interpretation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            // Definitions
            Text(
              "Definitions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "For the purposes of this Privacy Policy:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            // Account, Affiliate, Application, Company, Country, Device, Personal Data, Service, Service Provider, Usage Data, You
            Text(
              "  • Account means a unique account created for You to access our Service or parts of our Service.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "  • Affiliate means an entity that controls, is controlled by or is under common control with a party, where 'control' means ownership of 50% or more of the shares, equity interest, or other securities entitled to vote for election of directors or other managing authority.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Definitions...

            // Collecting and Using Your Personal Data
            Text(
              "Collecting and Using Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Types of Data Collected
            Text(
              "Types of Data Collected",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Personal Data
            Text(
              "Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Email address, First name and last name, Usage Data
            Text(
              "  • Email address",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "  • First name and last name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "  • Usage Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Personal Data...

            // Usage Data
            Text(
              "Usage Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Usage Data is collected automatically when using the Service.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the Usage Data...

            // Use of Your Personal Data
            Text(
              "Use of Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // The Company may use Personal Data for the following purposes:
            Text(
              "The Company may use Personal Data for the following purposes:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            // To provide and maintain our Service...
            Text(
              "  • To provide and maintain our Service, including to monitor the usage of our Service.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Use of Your Personal Data...

            // We may share Your personal information in the following situations:
            Text(
              "We may share Your personal information in the following situations:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            // With Service Providers...
            Text(
              "  • With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Sharing information...

            // Retention of Your Personal Data
            Text(
              "Retention of Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // The Company will retain Your Personal Data only for as long as is necessary...
            Text(
              "The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Retention of Your Personal Data...

            // Transfer of Your Personal Data
            Text(
              "Transfer of Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Your information, including Personal Data, is processed at the Company's operating offices...
            Text(
              "Your information, including Personal Data, is processed at the Company's operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Transfer of Your Personal Data...

            // Delete Your Personal Data
            Text(
              "Delete Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You...
            Text(
              "You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Delete Your Personal Data...

            // Disclosure of Your Personal Data
            Text(
              "Disclosure of Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Business Transactions...
            Text(
              "Business Transactions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Continue adding the rest of the Disclosure of Your Personal Data...

            // Law enforcement...
            Text(
              "Law enforcement",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Continue adding the rest of the Law enforcement...

            // Other legal requirements...
            Text(
              "Other legal requirements",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Continue adding the rest of the Other legal requirements...

            // Security of Your Personal Data
            Text(
              "Security of Your Personal Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet...
            Text(
              "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Security of Your Personal Data...

            // Children's Privacy
            Text(
              "Children's Privacy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Our Service does not address anyone under the age of 13...
            Text(
              "Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Children's Privacy...

            // Links to Other Websites
            Text(
              "Links to Other Websites",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Our Service may contain links to other websites that are not operated by Us...
            Text(
              "Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy of every site You visit.\n\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Links to Other Websites...

            // Changes to this Privacy Policy
            Text(
              "Changes to this Privacy Policy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // We may update Our Privacy Policy from time to time...
            Text(
              "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the 'Last updated' date at the top of this Privacy Policy.\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Changes to this Privacy Policy...

            // Contact Us
            Text(
              "Contact Us",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // If you have any questions about this Privacy Policy, You can contact us...
            Text(
              "If you have any questions about this Privacy Policy, You can contact us:\n\n  • By email: bibinpeter2018@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Continue adding the rest of the Contact Us...
          ],
        ),
      ),
    );
  }
}
