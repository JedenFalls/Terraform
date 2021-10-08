package test

import (
	"fmt"
	"reflect"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformStorageAccountBlobUrl(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/storage-account",

		// BackendConfig: map[string]interface{}{
		// 	"storage_account_name": "",
		// 	"container_name":       "",
		// 	"key":                  "",
		// 	"access_key":           "",
		// },

		VarFiles:    []string{"../../secrets/azure_access.tfvars"},
		Reconfigure: true,
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	output_sa_names := terraform.Output(t, terraformOptions, "sa_names")

	output_sa_names = strings.ReplaceAll(output_sa_names, "[", "")
	output_sa_names = strings.ReplaceAll(output_sa_names, "]", "")
	sa_names_list := strings.Fields(output_sa_names)

	fmt.Println("===========")
	fmt.Println(sa_names_list)
	fmt.Println(sa_names_list[0])
	fmt.Println(sa_names_list[1])
	fmt.Println(reflect.TypeOf(sa_names_list))
	fmt.Println(reflect.TypeOf(sa_names_list[0]))
	fmt.Println("===========")

	assert.Equal(t, "amrexamplesa01", sa_names_list[0])
	assert.Equal(t, "amrexamplesa02", sa_names_list[1])
}
